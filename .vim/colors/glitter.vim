" Vim color file
" Name:        glitter
" Author:      8th
" Last Change: 28-Nov-2012.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "glitter"

" General colors"{{{
hi Normal           guifg=#C0C0C0  guibg=#000000  gui=NONE
hi NonText          guifg=#000000  guibg=NONE     gui=NONE
hi Directory        guifg=#6699FF  guibg=NONE     gui=NONE
hi LineNr           guifg=#333333  guibg=#060606  gui=NONE
hi Title            guifg=#C0C0C0  guibg=NONE     gui=NONE
hi Visual           guifg=NONE     guibg=#333366  gui=NONE
"hi VisualNos
hi SpecialKey       guifg=#333366  guibg=#090909  gui=NONE
hi MatchParen       guifg=#FFFFFF  guibg=#333333  gui=bold
hi Cursor           guifg=#000000  guibg=#66FF99  gui=NONE
hi CursorLine       guifg=NONE     guibg=#121212  gui=NONE
hi CursorLineNr     guifg=#333333  guibg=#121212  gui=NONE
hi CursorColumn     guifg=NONE     guibg=#121212  gui=NONE
hi Search           guifg=#000000  guibg=#CC99FF  gui=underline
hi IncSearch        guifg=#000000  guibg=#66FF99  gui=NONE
hi ErrorMsg         guifg=#000000  guibg=#66FF99  gui=bold
hi WarningMsg       guifg=#000000  guibg=#66FF99  gui=bold
hi ModeMsg          guifg=#66FF99  guibg=NONE     gui=bold
hi MoreMsg          guifg=#66FF99  guibg=NONE     gui=bold
hi Question         guifg=#66FF99  guibg=NONE     gui=underline
hi TabLine          guifg=#333333  guibg=NONE     gui=underline
hi TabLineFill      guifg=#333333  guibg=NONE     gui=NONE
hi TabLineSel       guifg=#CC99FF  guibg=NONE     gui=underline
hi StatusLine       guifg=#CC99FF  guibg=NONE     gui=underline
hi StatusLineNC     guifg=#595857  guibg=NONE     gui=underline
hi VertSplit        guifg=#333366  guibg=NONE     gui=NONE
hi WildMenu         guifg=#66FF99  guibg=NONE     gui=NONE
hi Folded           guifg=#6633FF  guibg=#121212  gui=NONE
hi FoldColumn       guifg=#6633FF  guibg=#000000  gui=NONE
hi ColorColumn      guifg=NONE     guibg=#333366  gui=NONE
" hi SignColumn       guifg=#FFFFFF  guibg=#121212  gui=NONE
hi Conceal          guifg=#66FF99  guibg=NONE     gui=NONE
hi SpellBad         guifg=NONE     guibg=NONE     gui=undercurl  guisp=#FF0066
hi SpellCap         guifg=NONE     guibg=NONE     gui=undercurl  guisp=#FF0066
hi SpellRare        guifg=NONE     guibg=NONE     gui=undercurl  guisp=#FF0066
hi SpellLocal       guifg=NONE     guibg=NONE     gui=undercurl  guisp=#FF0066
hi DiffAdd          guifg=#121212  guibg=#6699FF  gui=bold
hi DiffChange       guifg=#121212  guibg=#FF6699  gui=NONE
hi DiffDelete       guifg=#333366  guibg=NONE     gui=NONE
hi DiffText         guifg=#121212  guibg=#FF0066  gui=bold
hi Pmenu            guifg=#FFFFFF  guibg=#333333  gui=NONE
hi PmenuSel         guifg=#121212  guibg=#6699FF  gui=NONE
hi PmenuSbar        guifg=NONE     guibg=#121212  gui=NONE
hi PmenuThumb       guifg=NONE     guibg=#6699FF  gui=NONE
"}}}
" Syntax highlighting"{{{
hi Comment          guifg=#595857  guibg=NONE     gui=italic
hi String           guifg=#66FF99  guibg=NONE     gui=NONE
hi Number           guifg=#FF0066  guibg=NONE     gui=NONE
hi PreProc          guifg=#FF6699  guibg=NONE     gui=NONE
hi Keyword          guifg=#6633FF  guibg=NONE     gui=NONE
hi Conditional      guifg=#6633FF  guibg=NONE     gui=NONE
hi Function         guifg=#6633FF  guibg=NONE     gui=NONE
hi Statement        guifg=#6633FF  guibg=NONE     gui=NONE
hi Todo             guifg=#FF0066  guibg=NONE     gui=NONE
hi Constant         guifg=#6699FF  guibg=NONE     gui=NONE
hi Type             guifg=#6699FF  guibg=NONE     gui=NONE
hi Operator         guifg=#6699FF  guibg=NONE     gui=NONE
hi Identifier       guifg=#C0C0C0  guibg=NONE     gui=NONE
hi Special          guifg=#FF6699  guibg=NONE     gui=NONE
hi Delimiter        guifg=#CC99FF  guibg=NONE     gui=NONE
hi Underlined       guifg=#66FF99  guibg=NONE     gui=underline
hi Error            guifg=#FF0066  guibg=NONE     gui=underline
hi CursorIM         guifg=NONE     guibg=#FF0066  gui=NONE

hi link Character            Constant
hi link Boolean              Constant
hi link Float                Number
hi link Repeat               Statement
hi link Label                PreProc
hi link Exception            Number
hi link Include              Special
hi link Define               Special
hi link Macro                PreProc
hi link PreCondit            PreProc
hi link StorageClass         Type
hi link Structure            Type
hi link Typedef              Type
hi link Tag                  Special
hi link SpecialChar          Special
hi link SpecialComment       Special
hi link Debug                Special
"hi link Ignore  Special
"}}}
" HTML"{{{
hi link htmlTag              Constant
hi link htmlTagName          Constant
hi link htmlEndTag           Constant
hi link htmlSpecialTagName   Number
hi link htmlArg              Constant
hi link javaScript           Delimiter
"}}}
" XML"{{{
hi link xmlEndTag            Keyword
"}}}
" Javascript"{{{
hi link javaScriptIdentifier         Type
hi link javaScriptParens             Delimiter
hi link javaScriptBraces             Delimiter
hi link javaScriptEndColons          Delimiter
hi link javaScriptBrowserObjects     Delimiter
hi link javaScriptDOMObjects         Delimiter
hi link javaScriptDOMMethods         Identifier
hi link javaScriptHtmlElemProperties Delimiter
" hi link javaScriptFunction         Preproc
" hi link javaScriptLabel            PreProc
"}}}
" Ruby"{{{
hi rubyRegexp                guifg=#FF0066  guibg=NONE  gui=bold
hi rubyRegexpDelimiter       guifg=#FF0066  guibg=NONE  gui=bold
hi rubyIdentifier            guifg=#FF6699  guibg=NONE  gui=NONE

hi link rubySymbol           Identifier
hi link rubyFunction         Constant
hi link rubyKeyword          Number
hi link rubyClassVariable    Delimiter
hi link rubyInstanceVariable Delimiter
hi link rubyBlockParameter   Identifier

hi link rubyDelimiter                Statement
hi link rubyInterPolationDelimiter   Statement
hi link rubyStringDelimiter          Statement
hi link rubySymbolDelimiter          Statement

" hi link rubyClass            Statement
" hi link rubyDefine           Statement
" hi link rubyModule           Statement
" hi link rubyPseudoVariable  Number
" hi link rubyConstant         Preproc
" hi link rubyPredefinedIdentifier Number

hi link rubyPredefinedVariable Delimiter
hi link rubyPredefinedConstant Delimiter
" hi link rubyConstant           Delimiter
hi link rubyBoolean            Delimiter
hi link rubyOperator           Delimiter

" hi link rubyControl          Delimiter
" hi link rubyBeginEnd         Delimiter
"}}}
" eruby"{{{
" hi link erubyDelimiter   Delimiter
"}}}
" Python"{{{
hi link pythonFunction       Preproc
"}}}
" vimshell"{{{
hi link vimshellPrompt       String
"}}}
" CoffeeScript"{{{
hi link coffeeObjAssign      Preproc
hi link coffeeBlock          Delimiter
"}}}
