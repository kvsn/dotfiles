set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="minimalist"

hi Normal	ctermfg=254	ctermbg=none
hi Comment	ctermfg=117	ctermbg=none
hi Constant	ctermfg=210	ctermbg=none
hi Cursor	ctermfg=066	ctermbg=222
hi DiffAdd	ctermfg=254	ctermbg=022	cterm=none
hi DiffChange	ctermfg=254	ctermbg=none	cterm=none
hi DiffDelete	ctermfg=254	ctermbg=052	cterm=none
hi DiffText	ctermfg=254	ctermbg=094	cterm=none
hi Directory	ctermfg=120	ctermbg=none
hi Error	ctermfg=255 	ctermbg=196
hi ErrorMsg	ctermfg=255	ctermbg=196
hi FoldColumn	ctermfg=180	ctermbg=238
hi Folded	ctermfg=254	ctermbg=238	cterm=bold
hi Identifier	ctermfg=120	ctermbg=none	cterm=none
hi Ignore	ctermfg=240	ctermbg=none
hi IncSearch	ctermfg=254	ctermbg=166     cterm=none
hi LineNr	ctermfg=244	ctermbg=none
hi ModeMsg	ctermfg=178	ctermbg=none
hi MoreMsg	ctermfg=029	ctermbg=none
hi Pmenu	ctermfg=none	ctermbg=145
hi PmenuSbar	ctermfg=245	ctermbg=245
hi PmenuSel	ctermfg=none	ctermbg=226
hi PmenuThumb	ctermfg=241	ctermbg=241
hi PreProc	ctermfg=141	ctermbg=none
hi Question	ctermfg=048	ctermbg=none
hi Search	ctermfg=254	ctermbg=166
hi Special	ctermfg=217	ctermbg=none	cterm=none
hi SpecialKey	ctermfg=59	ctermbg=none
hi NonText	ctermfg=117	ctermbg=none	cterm=bold
hi SpellBad	ctermfg=224	ctermbg=196
hi SpellCap	ctermfg=224	ctermbg=196
hi Statement	ctermfg=222	ctermbg=none	cterm=none
hi StatusLine	ctermfg=145	ctermbg=none	cterm=reverse
hi StatusLineNC	ctermfg=145	ctermbg=243	cterm=reverse
hi Title	ctermfg=254	ctermbg=none	cterm=bold
hi Todo		ctermfg=none	ctermbg=226
hi Type		ctermfg=223	ctermbg=none	cterm=none
hi Underlined	ctermfg=117	ctermbg=none
hi VertSplit	ctermfg=145	ctermbg=243	cterm=reverse
hi Visual	ctermfg=064	ctermbg=255	cterm=reverse
hi WarningMsg	ctermfg=209	ctermbg=none
hi WildMenu	ctermfg=none	ctermbg=226
hi TabLineSel	ctermfg=254	ctermbg=none	cterm=bold
hi TabLine	ctermfg=none	ctermbg=240	cterm=none
hi TabLineFill	ctermfg=none	ctermbg=254	cterm=none
hi ExtraWS	ctermfg=254	ctermbg=196
hi ColorColumn	ctermfg=254	ctermbg=209	cterm=none

" Additional Groups
" Gui: VisualNOS
" Constant: String Character Number Boolean Float
" Identifier: Function
" Statement: Conditional Repeat Label Operator Keyword Exception
" PreProc: Include Define Macro PreCondit
" Type: StorageClass Structure Typedef
" Special: SpecialChar Tag Delimiter SpecialComment Debug
" Spelling: SpellBad SpellRare SpellLocal SpellCap
" Various: IncSearch SignColumn
