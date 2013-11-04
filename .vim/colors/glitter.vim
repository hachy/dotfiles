" Vim color file
" Name: glitter
" Author: 8th
" License: MIT

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "glitter"

" General colors"{{{
hi Normal ctermfg=250 ctermbg=NONE cterm=NONE guifg=#BCBCBC guibg=#080808 gui=NONE
hi NonText ctermfg=119 ctermbg=NONE cterm=NONE guifg=#87FF5F guibg=NONE gui=NONE
hi Directory ctermfg=157 ctermbg=NONE cterm=NONE guifg=#AFFFAF guibg=NONE gui=NONE
hi LineNr ctermfg=238 ctermbg=NONE cterm=NONE guifg=#444444 guibg=NONE gui=NONE
hi Title ctermfg=168 ctermbg=NONE cterm=NONE guifg=#D75F87 guibg=NONE gui=NONE
hi Visual ctermfg=119 ctermbg=97 cterm=NONE guifg=#87FF5F guibg=#875FAF gui=NONE
hi SpecialKey ctermfg=97 ctermbg=NONE cterm=NONE guifg=#875FAF guibg=NONE gui=NONE
hi MatchParen ctermfg=15 ctermbg=238 cterm=bold guifg=#FFFFFF guibg=#444444 gui=bold
hi Cursor ctermfg=16 ctermbg=119 cterm=NONE guifg=#000000 guibg=#87FF5F gui=NONE
hi CursorIM ctermfg=NONE ctermbg=162 cterm=NONE guifg=NONE guibg=#D70087 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#262626 gui=NONE
hi CursorLineNr ctermfg=242 ctermbg=235 cterm=bold guifg=#666666 guibg=#262626 gui=bold
hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#262626 gui=NONE
hi Search ctermfg=16 ctermbg=209 cterm=underline guifg=#000000 guibg=#FF875F gui=underline
hi IncSearch ctermfg=16 ctermbg=119 cterm=NONE guifg=#000000 guibg=#87FF5F gui=NONE
hi ErrorMsg ctermfg=16 ctermbg=119 cterm=bold guifg=#000000 guibg=#87FF5F gui=bold
hi WarningMsg ctermfg=16 ctermbg=119 cterm=bold guifg=#000000 guibg=#87FF5F gui=bold
hi ModeMsg ctermfg=119 ctermbg=NONE cterm=bold guifg=#87FF5F guibg=NONE gui=bold
hi MoreMsg ctermfg=119 ctermbg=NONE cterm=bold guifg=#87FF5F guibg=NONE gui=bold
hi Question ctermfg=119 ctermbg=NONE cterm=underline guifg=#87FF5F guibg=NONE gui=underline
hi TabLine ctermfg=242 ctermbg=234 cterm=NONE guifg=#666666 guibg=#1C1C1C gui=NONE
hi TabLineFill ctermfg=242 ctermbg=234 cterm=NONE guifg=#666666 guibg=#1C1C1C gui=NONE
hi TabLineSel ctermfg=119 ctermbg=NONE cterm=NONE guifg=#87FF5F guibg=NONE gui=NONE
hi StatusLine ctermfg=119 ctermbg=233 cterm=NONE guifg=#87FF5F guibg=#121212 gui=NONE
hi StatusLineNC ctermfg=97 ctermbg=NONE cterm=underline guifg=#875FAF guibg=NONE gui=underline
hi VertSplit ctermfg=97 ctermbg=NONE cterm=NONE guifg=#875FAF guibg=NONE gui=NONE
hi WildMenu ctermfg=119 ctermbg=NONE cterm=NONE guifg=#87FF5F guibg=NONE gui=NONE
hi Folded ctermfg=157 ctermbg=234 cterm=NONE guifg=#AFFFAF guibg=#1C1C1C gui=NONE
hi FoldColumn ctermfg=157 ctermbg=NONE cterm=NONE guifg=#AFFFAF guibg=#080808 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=97 cterm=NONE guifg=NONE guibg=#875FAF gui=NONE
hi SignColumn ctermfg=NONE ctermbg=16 cterm=NONE guifg=NONE guibg=#000000 gui=NONE
hi Conceal ctermfg=119 ctermbg=NONE cterm=NONE guifg=#87FF5F guibg=NONE gui=NONE
hi SpellBad ctermfg=162 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D70087
hi SpellCap ctermfg=162 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D70087
hi SpellRare ctermfg=162 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D70087
hi SpellLocal ctermfg=162 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D70087
hi DiffAdd ctermfg=234 ctermbg=157 cterm=NONE guifg=#1C1C1C guibg=#AFFFAF gui=NONE
hi DiffChange ctermfg=234 ctermbg=168 cterm=NONE guifg=#1C1C1C guibg=#D75F87 gui=NONE
hi DiffDelete ctermfg=97 ctermbg=NONE cterm=NONE guifg=#875FAF guibg=NONE gui=NONE
hi DiffText ctermfg=234 ctermbg=162 cterm=NONE guifg=#1C1C1C guibg=#D70087 gui=NONE
hi Pmenu ctermfg=119 ctermbg=16 cterm=NONE guifg=#87FF5F guibg=#000000 gui=NONE
hi PmenuSel ctermfg=16 ctermbg=119 cterm=NONE guifg=#000000 guibg=#87FF5F gui=NONE
hi PmenuSbar ctermfg=NONE ctermbg=NONE  cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuThumb ctermfg=NONE ctermbg=119 cterm=NONE guifg=NONE guibg=#87FF5F gui=NONE
"}}}
" Syntax highlighting"{{{
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#666666 guibg=NONE gui=italic
hi Constant ctermfg=119 ctermbg=NONE cterm=NONE guifg=#87FF5F guibg=NONE gui=NONE
hi Number ctermfg=209 ctermbg=NONE cterm=NONE guifg=#FF875F guibg=NONE gui=NONE
hi PreProc ctermfg=135 ctermbg=NONE cterm=NONE guifg=#AF5FFF guibg=NONE gui=NONE
hi Identifier ctermfg=111 ctermbg=NONE cterm=NONE guifg=#87AFFF guibg=NONE gui=NONE
hi Statement ctermfg=171 ctermbg=NONE cterm=NONE guifg=#D75FFF guibg=NONE gui=NONE
hi Type ctermfg=157 ctermbg=NONE cterm=NONE guifg=#AFFFAF guibg=NONE gui=NONE
hi Special ctermfg=209 ctermbg=NONE cterm=NONE guifg=#FF875F guibg=NONE gui=NONE
hi Underlined ctermfg=119 ctermbg=NONE cterm=underline guifg=#87FF5F guibg=NONE gui=underline
hi Error ctermfg=162 ctermbg=NONE cterm=underline guifg=#D70087 guibg=NONE gui=underline
hi Todo ctermfg=162 ctermbg=NONE cterm=NONE guifg=#D70087 guibg=NONE gui=NONE
"hi Ignore
hi link String Type
hi link Character Constant
hi link Boolean Constant
hi link Float Number
hi link Function Identifier
hi link Conditional Statement
hi link Repeat Statement
hi link Operator Statement
hi link Keyword Statement
hi link Label Statement
hi link Exception Number
hi link Include Preproc
hi link Define Preproc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link SpecialChar Special
hi link Tag Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special
"}}}
" HTML"{{{
hi link htmlTag Statement
hi link htmlTagName Constant
hi link htmlEndTag Statement
hi link htmlSpecialTagName Number
hi link htmlArg Statement
hi link javaScript Normal
hi htmlItalic ctermfg=250 ctermbg=NONE cterm=NONE
"}}}
" XML"{{{
hi link xmlEndTag Keyword
"}}}
" Javascript"{{{
hi link javaScriptIdentifier Type
hi link javaScriptDOMMethods Normal
hi link javaScriptNumber Number
"}}}
" Ruby"{{{
hi rubyRegexp ctermfg=162 ctermbg=NONE cterm=bold guifg=#D70087 guibg=NONE gui=bold
hi rubyRegexpDelimiter ctermfg=162 ctermbg=NONE cterm=bold guifg=#D70087 guibg=NONE gui=bold
hi rubyIdentifier ctermfg=250 ctermbg=NONE cterm=bold guifg=#BCBCBC guibg=NONE gui=bold
hi link rubyAccess Special
hi link rubyConstant Constant
hi link rubyFunction Constant
hi link rubyKeyword Number
hi link rubySymbol Identifier
hi link rubyClassVariable Identifier
hi link rubyInstanceVariable Identifier
hi link rubyBlockParameter Normal
hi link rubyBoolean Normal
hi link rubyPseudoVariable Constant
hi link rubyPredefinedVariable Type
"}}}
" eruby"{{{
hi link erubyDelimiter Special
"}}}
" Python"{{{
hi link pythonFunction Constant
"}}}
" CoffeeScript"{{{
hi link coffeeObjAssign Preproc
hi link coffeeBlock Normal
hi link coffeeSpecialIdent Normal
"}}}
" php"{{{
hi link phpParent Normal
"}}}
