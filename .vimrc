" vim: fdm=marker et ts=8 sw=4 sts=4

" Enable full power of vim
set nocompatible

" Load pathogen package manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Enhanced Commentify
let g:EnhCommentifyRespectIndent = 'yes'
let g:EnhCommentifyPretty = 'yes'
let g:EnhCommentifyUseSyntax = 'yes'
let g:EnhCommentifyUseBlockIndent = 'yes'
let g:EnhCommentifyUserBindings = 'yes'  " Don't bind any keys, thank you.

" Tab title
let g:tabtitle_dir_suffix = 'if_ambiguous'  " always, never, if_ambiguous
let g:tabtitle_hidden_extensions = ['py']
let g:tabtitle_max_file_len = 11
let g:tabtitle_max_dir_len = 11

" Make <Del> work in all modes and leave the default register alone.
nnoremap <Del> "_x
vnoremap <Del> "_d

" \c (un)comments
map <silent> <LocalLeader>c :call EnhancedCommentify('yes', 'first')<CR><Down>
vmap <silent> <LocalLeader>c <Esc>:call EnhancedCommentify('yes', 'first', line("'<"), line("'>"))<CR><Down>

" \d dims pattern matches
map <silent> <LocalLeader>d :nohl<CR>

" Indentation
command! -nargs=? Tabs if <q-args> == '' | call <SID>Tabs(8) | else | call <SID>Tabs(<q-args>) | endif
command! -nargs=? Spaces if <q-args> == '' | call <SID>Spaces(4) | else | call <SID>Spaces(<q-args>) | endif

" Strip trailing whitespace from all lines
command! StripWS call <SID>StripTrailingWhitespace()

" Remove all autocommands for the current group.
autocmd!

" Jump to the last known position in a file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exec "normal g'\"" | endif

" Strip trailing whitespace from all lines
function! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

" Use real tabs for indentation, and display them as n spaces wide.
function! <SID>Tabs(n)
    let n = str2nr(a:n)
    exec 'set noet ts=' . n . ' sts=0 sw=' . n
endfunction

" Use spaces for indentation, and use n spaces for each tab.
function! <SID>Spaces(n)
    let n = str2nr(a:n)
    exec 'set et ts=8 sts=' . n . ' sw=' . n
endfunction

" Change to dir of current file.
set autochdir

" Enable filetype detection
filetype on

" Enable filetype-specific indenting
filetype indent on

" Enable filetype-specific plugins
filetype plugin on

" Save last 100 commands/search patterns
set history=100

" Copy indentation level of previous line
set autoindent

" Highlight search matches
set hlsearch

" Stop the beeping!
set vb t_vb=

" Awesome tab completion
set wildmenu
set wildmode=longest:full,full
set wildignore = ".*,*.o,*.obj,*.pyc,*.pyo"

" Don't scan included files, this is way too slow.
set complete-=i

" Detect external changes
set autoread

" Line number always visible
set ruler

" Indent intelligently
set shiftround

" Jump to matching brackets
set showmatch

" Do not show single line of minimized windows
set wmh=0

" Smart tabs
set smarttab

" Backspacing
set backspace=eol,start,indent

" Disable mouse support
set mouse=

" Search dirtree upwardly for a tags file
set tags=./tags;,tags

" Hide dotfiles in the file browser
let g:netrw_list_hide = '^\..*'

" Default indentation
Spaces

" Ignore case, except when using upper-case letters in search pattern
set ignorecase
set smartcase

" Sane colorscheme.
exec 'colorscheme ' . (!has('gui_running') && &t_Co == 256 ? 'minimalist' : 'default')

" Enable syntax highlighting.
syntax on

" Recursively search current dir and startup dir with find and cd commands.
set path=,**,$PWD/**
set cdpath=,**,$PWD/**

" Enable hidden buffers.
set hidden

" List character
set list
set listchars=tab:»·,trail:·

set completeopt-=preview
