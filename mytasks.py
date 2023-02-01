#!/usr/bin/python3

import os
import shlex
import termcolor

from invoke import task
from typing import List


def print_title(message: str) -> None:
    termcolor.cprint('> ' + message, attrs=['bold'])


class GitStatus:

    ADDED = 'A'
    MODIFIED = 'M'
    RENAMED = 'R'
    COPIED = 'C'

    SPACE = ' '
    NULL = '\x00'

    def __init__(self, string: str) -> None:
        self.string = string
        self.index = 0

    @property
    def char(self) -> str:
        return self.string[self.index]

    def check(self, expected: str):
        end = self.index + len(expected)
        actual = self.string[self.index:end]
        if actual != expected:
            raise ValueError(f"expected '{expected}' but got '{actual}'")
        self.index += len(expected)

    @classmethod
    def added_modified(cls, letter):
        return letter in (cls.ADDED, cls.MODIFIED)

    @classmethod
    def renamed_copied(cls, letter):
        return letter in (cls.RENAMED, cls.COPIED)

    def parse_filename(self) -> str:
        end = self.string.index(self.NULL, self.index)
        result = self.string[self.index:end]
        self.index = end + 1
        return result

    def parse(self) -> List[str]:
        result = []

        while self.index < len(self.string):
            # Status in the git index
            index_letter = self.char
            self.index += 1

            # Status in the working tree
            tree_letter = self.char
            self.index += 1

            self.check(self.SPACE)

            if self.renamed_copied(index_letter) or self.renamed_copied(tree_letter):
                filename, _ = self.parse_filename(), self.parse_filename()
                result.append(filename)
            elif self.added_modified(index_letter) or self.added_modified(tree_letter):
                filename = self.parse_filename()
                result.append(filename)
            else:
                self.parse_filename()

        return result


def get_changeset(context, extension='.py'):
    cmd = 'git status -z'
    output = context.run(cmd, hide='both').stdout
    status = GitStatus(output)
    changeset = status.parse()
    for filename in changeset:
        assert os.path.exists(filename)
    if extension:
        changeset = [f for f in changeset if f.endswith(extension)]
    return changeset


@task
def grep(context, all=False):
    title = 'Grepping'
    if not all:
        title += ' on changeset'
    print_title(title)
    cmd = r'! grep --color -r --include \*.py --exclude=mytasks.py -n -w -e FIXME -e XXX -e set_trace -e breakpoint'
    cmd = cmd.split()
    if not all:
        changeset = get_changeset(context)
        if not changeset:
            return
        cmd.extend(map(shlex.quote, changeset))
    context.run(' '.join(cmd), pty=True)


@task
def lint(context, all=False):
    title = 'Running flake8'
    if not all:
        title += ' on changeset'
    print_title(title)
    cmd = 'flake8 --count'.split()
    if not all:
        changeset = get_changeset(context)
        if not changeset:
            return
        cmd.extend(map(shlex.quote, changeset))
    context.run(' '.join(cmd), pty=True)


@task(grep, lint, default=True)
def checks(_):
    termcolor.cprint('Code checks have completed successfully!', 'green', attrs=['bold'])
