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
hi NonText ctermfg=65 ctermbg=NONE cterm=NONE guifg=#5F875F guibg=NONE gui=NONE
hi Directory ctermfg=74 ctermbg=NONE cterm=NONE guifg=#5FAFD7 guibg=NONE gui=NONE
hi LineNr ctermfg=238 ctermbg=NONE cterm=NONE guifg=#444444 guibg=NONE gui=NONE
hi Title ctermfg=169 ctermbg=NONE cterm=NONE guifg=#D75FAF guibg=NONE gui=NONE
hi Visual ctermfg=121 ctermbg=65 cterm=NONE guifg=#87FFAF guibg=#5F875F gui=NONE
hi SpecialKey ctermfg=65 ctermbg=NONE cterm=NONE guifg=#5F875F guibg=NONE gui=NONE
hi MatchParen ctermfg=15 ctermbg=238 cterm=bold guifg=#FFFFFF guibg=#444444 gui=bold
hi Cursor ctermfg=16 ctermbg=121 cterm=NONE guifg=#000000 guibg=#87FFAF gui=NONE
hi CursorIM ctermfg=NONE ctermbg=162 cterm=NONE guifg=NONE guibg=#D70087 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1C1C1C gui=NONE
hi CursorLineNr ctermfg=242 ctermbg=234 cterm=bold guifg=#666666 guibg=#1C1C1C gui=bold
hi CursorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1C1C1C gui=NONE
hi Search ctermfg=16 ctermbg=98 cterm=underline guifg=#000000 guibg=#875FD7 gui=underline
hi IncSearch ctermfg=16 ctermbg=121 cterm=NONE guifg=#000000 guibg=#87FFAF gui=NONE
hi ErrorMsg ctermfg=16 ctermbg=121 cterm=bold guifg=#000000 guibg=#87FFAF gui=bold
hi WarningMsg ctermfg=16 ctermbg=121 cterm=bold guifg=#000000 guibg=#87FFAF gui=bold
hi ModeMsg ctermfg=121 ctermbg=NONE cterm=bold guifg=#87FFAF guibg=NONE gui=bold
hi MoreMsg ctermfg=121 ctermbg=NONE cterm=bold guifg=#87FFAF guibg=NONE gui=bold
hi Question ctermfg=121 ctermbg=NONE cterm=underline guifg=#87FFAF guibg=NONE gui=underline
hi TabLine ctermfg=242 ctermbg=234 cterm=NONE guifg=#666666 guibg=#1C1C1C gui=NONE
hi TabLineFill ctermfg=242 ctermbg=234 cterm=NONE guifg=#666666 guibg=#1C1C1C gui=NONE
hi TabLineSel ctermfg=121 ctermbg=NONE cterm=NONE guifg=#87FFAF guibg=NONE gui=NONE
hi StatusLine ctermfg=121 ctermbg=233 cterm=NONE guifg=#87FFAF guibg=#121212 gui=NONE
hi StatusLineNC ctermfg=65 ctermbg=NONE cterm=underline guifg=#5F875F guibg=NONE gui=underline
hi VertSplit ctermfg=98 ctermbg=NONE cterm=NONE guifg=#875FD7 guibg=NONE gui=NONE
hi WildMenu ctermfg=121 ctermbg=NONE cterm=NONE guifg=#87FFAF guibg=NONE gui=NONE
hi Folded ctermfg=74 ctermbg=234 cterm=NONE guifg=#5FAFD7 guibg=#1C1C1C gui=NONE
hi FoldColumn ctermfg=74 ctermbg=NONE cterm=NONE guifg=#5FAFD7 guibg=#080808 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=65 cterm=NONE guifg=NONE guibg=#5F875F gui=NONE
" hi SignColumn
hi Conceal ctermfg=121 ctermbg=NONE cterm=NONE guifg=#87FFAF guibg=NONE gui=NONE
hi SpellBad ctermfg=162 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D70087
hi SpellCap ctermfg=162 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D70087
hi SpellRare ctermfg=162 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D70087
hi SpellLocal ctermfg=162 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D70087
hi DiffAdd ctermfg=234 ctermbg=74 cterm=NONE guifg=#1C1C1C guibg=#5FAFD7 gui=NONE
hi DiffChange ctermfg=234 ctermbg=169 cterm=NONE guifg=#1C1C1C guibg=#D75FAF gui=NONE
hi DiffDelete ctermfg=65 ctermbg=NONE cterm=NONE guifg=#5F875F guibg=NONE gui=NONE
hi DiffText ctermfg=234 ctermbg=162 cterm=NONE guifg=#1C1C1C guibg=#D70087 gui=NONE
hi Pmenu ctermfg=183 ctermbg=238 cterm=NONE guifg=#D7AFFF guibg=#444444 gui=NONE
hi PmenuSel ctermfg=16 ctermbg=98 cterm=NONE guifg=#000000 guibg=#875FD7 gui=NONE
hi PmenuSbar ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1C1C1C gui=NONE
hi PmenuThumb ctermfg=NONE ctermbg=98 cterm=NONE guifg=NONE guibg=#875FD7 gui=NONE
"}}}
" Syntax highlighting"{{{
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#666666 guibg=NONE gui=italic
hi String ctermfg=121 ctermbg=NONE cterm=NONE guifg=#87FFAF guibg=NONE gui=NONE
hi Number ctermfg=162 ctermbg=NONE cterm=NONE guifg=#D70087 guibg=NONE gui=NONE
hi PreProc ctermfg=169 ctermbg=NONE cterm=NONE guifg=#D75FAF guibg=NONE gui=NONE
hi Identifier ctermfg=183 ctermbg=NONE cterm=NONE guifg=#D7AFFF guibg=NONE gui=NONE
hi Statement ctermfg=98 ctermbg=NONE cterm=NONE guifg=#875FD7 guibg=NONE gui=NONE
hi Constant ctermfg=74 ctermbg=NONE cterm=NONE guifg=#5FAFD7 guibg=NONE gui=NONE
hi Type ctermfg=74 ctermbg=NONE cterm=NONE guifg=#5FAFD7 guibg=NONE gui=NONE
hi Special ctermfg=169 ctermbg=NONE cterm=NONE guifg=#D75FAF guibg=NONE gui=NONE
" hi Delimiter ctermfg=162 ctermbg=NONE cterm=NONE guifg=#D70087 guibg=NONE gui=NONE
hi Underlined ctermfg=121 ctermbg=NONE cterm=underline guifg=#87FFAF guibg=NONE gui=underline
hi Error ctermfg=162 ctermbg=NONE cterm=underline guifg=#D70087 guibg=NONE gui=underline
hi Todo ctermfg=162 ctermbg=NONE cterm=NONE guifg=#D70087 guibg=NONE gui=NONE
"hi Ignore

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
hi link rubyConstant Constant
hi link rubyFunction Constant
hi link rubyKeyword Number
hi link rubySymbol Identifier
hi link rubyInstanceVariable Identifier
hi link rubyBlockParameter Normal
hi link rubyBoolean Normal
hi link rubyPseudoVariable Normal
"}}}
" Python"{{{
hi link pythonFunction Preproc
"}}}
" CoffeeScript"{{{
hi link coffeeObjAssign Preproc
hi link coffeeBlock Normal
hi link coffeeSpecialIdent Normal
"}}}
" php"{{{
hi link phpParent Normal
"}}}
