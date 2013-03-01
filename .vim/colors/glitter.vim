" Vim color file
" Name   :  glitter
" Author :  8th

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "glitter"

" General colors"{{{
hi Normal           guifg=#ADADAD  guibg=#030303  gui=NONE
hi NonText          guifg=#030303  guibg=NONE     gui=NONE
hi Directory        guifg=#8EC1FF  guibg=NONE     gui=NONE
hi LineNr           guifg=#333333  guibg=#090909  gui=NONE
hi Title            guifg=#ADADAD  guibg=NONE     gui=NONE
hi Visual           guifg=#C99EFF  guibg=#333366  gui=NONE
"hi VisualNos
hi SpecialKey       guifg=#333366  guibg=#090909  gui=NONE
hi MatchParen       guifg=#FFFFFF  guibg=#333333  gui=bold
hi Cursor           guifg=#000000  guibg=#9EFFC9  gui=NONE
hi CursorLine       guifg=NONE     guibg=#121212  gui=NONE
hi CursorLineNr     guifg=#666666  guibg=#121212  gui=NONE
hi CursorColumn     guifg=NONE     guibg=#121212  gui=NONE
hi Search           guifg=#000000  guibg=#9865FF  gui=underline
hi IncSearch        guifg=#000000  guibg=#9EFFC9  gui=NONE
hi ErrorMsg         guifg=#000000  guibg=#9EFFC9  gui=bold
hi WarningMsg       guifg=#000000  guibg=#9EFFC9  gui=bold
hi ModeMsg          guifg=#9EFFC9  guibg=NONE     gui=bold
hi MoreMsg          guifg=#9EFFC9  guibg=NONE     gui=bold
hi Question         guifg=#9EFFC9  guibg=NONE     gui=underline
hi TabLine          guifg=#666666  guibg=#121212  gui=NONE
hi TabLineFill      guifg=#666666  guibg=#121212  gui=NONE
hi TabLineSel       guifg=#9EFFC9  guibg=NONE     gui=NONE
hi StatusLine       guifg=#9EFFC9  guibg=#333333  gui=NONE
hi StatusLineNC     guifg=#666666  guibg=NONE     gui=underline
hi VertSplit        guifg=#333366  guibg=NONE     gui=NONE
hi WildMenu         guifg=#9EFFC9  guibg=NONE     gui=NONE
hi Folded           guifg=#8EC1FF  guibg=#121212  gui=NONE
hi FoldColumn       guifg=#8EC1FF  guibg=#030303  gui=NONE
hi ColorColumn      guifg=NONE     guibg=#333366  gui=NONE
" hi SignColumn       guifg=#FFFFFF  guibg=#121212  gui=NONE
hi Conceal          guifg=#9EFFC9  guibg=NONE     gui=NONE
hi SpellBad         guifg=NONE     guibg=NONE     gui=undercurl  guisp=#EA2AA4
hi SpellCap         guifg=NONE     guibg=NONE     gui=undercurl  guisp=#EA2AA4
hi SpellRare        guifg=NONE     guibg=NONE     gui=undercurl  guisp=#EA2AA4
hi SpellLocal       guifg=NONE     guibg=NONE     gui=undercurl  guisp=#EA2AA4
hi DiffAdd          guifg=#121212  guibg=#8EC1FF  gui=NONE
hi DiffChange       guifg=#121212  guibg=#FF60AA  gui=NONE
hi DiffDelete       guifg=#333366  guibg=NONE     gui=NONE
hi DiffText         guifg=#121212  guibg=#EA2AA4  gui=NONE
hi Pmenu            guifg=#ADADAD  guibg=#333333  gui=NONE
hi PmenuSel         guifg=#121212  guibg=#8EC1FF  gui=NONE
hi PmenuSbar        guifg=NONE     guibg=#121212  gui=NONE
hi PmenuThumb       guifg=NONE     guibg=#8EC1FF  gui=NONE
"}}}
" Syntax highlighting"{{{
hi Comment          guifg=#666666  guibg=NONE     gui=italic
hi String           guifg=#9EFFC9  guibg=NONE     gui=NONE
hi Number           guifg=#EA2AA4  guibg=NONE     gui=NONE
hi PreProc          guifg=#FF60AA  guibg=NONE     gui=NONE
hi Keyword          guifg=#9865FF  guibg=NONE     gui=NONE
hi Conditional      guifg=#9865FF  guibg=NONE     gui=NONE
hi Function         guifg=#9865FF  guibg=NONE     gui=NONE
hi Statement        guifg=#9865FF  guibg=NONE     gui=NONE
hi Todo             guifg=#EA2AA4  guibg=NONE     gui=NONE
hi Constant         guifg=#8EC1FF  guibg=NONE     gui=NONE
hi Type             guifg=#8EC1FF  guibg=NONE     gui=NONE
hi Operator         guifg=#8EC1FF  guibg=NONE     gui=NONE
hi Identifier       guifg=#C99EFF  guibg=NONE     gui=NONE
hi Special          guifg=#FF60AA  guibg=NONE     gui=NONE
hi Delimiter        guifg=#EA2AA4  guibg=NONE     gui=NONE
hi Underlined       guifg=#9EFFC9  guibg=NONE     gui=underline
hi Error            guifg=#EA2AA4  guibg=NONE     gui=underline
hi CursorIM         guifg=NONE     guibg=#EA2AA4  gui=NONE

hi link Character            Constant
hi link Boolean              Constant
hi link Float                Number
hi link Repeat               Statement
hi link Label                PreProc
hi link Exception            Number
hi link Include              Preproc
hi link Define               Preproc
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
hi link htmlTag              Function
hi link htmlTagName          Constant
hi link htmlEndTag           Function
hi link htmlSpecialTagName   Number
hi link htmlArg              Function
hi link javaScript           Title
"}}}
" XML"{{{
hi link xmlEndTag            Keyword
"}}}
" Javascript"{{{
hi link javaScriptIdentifier         Type
hi link javaScriptDOMMethods         Title
hi link javaScriptNumber             Number
" hi link javaScriptParens             Delimiter
" hi link javaScriptBraces             Delimiter
" hi link javaScriptEndColons          Delimiter
" hi link javaScriptBrowserObjects     Delimiter
" hi link javaScriptDOMObjects         Delimiter
" hi link javaScriptHtmlElemProperties Delimiter
" hi link javaScriptFunction         Preproc
" hi link javaScriptLabel            PreProc
"}}}
" Ruby"{{{
hi rubyRegexp                      guifg=#EA2AA4  guibg=NONE  gui=bold
hi rubyRegexpDelimiter             guifg=#EA2AA4  guibg=NONE  gui=bold
hi rubyIdentifier                  guifg=#ADADAD  guibg=NONE  gui=bold
hi link rubyConstant               Constant
hi link rubyFunction               Constant
hi link rubyKeyword                Number
hi link rubySymbol                 Identifier
hi link rubyInstanceVariable       Identifier
" hi link rubyClassVariable          Delimiter
hi link rubyBlockParameter         Title
" hi link rubyDelimiter              Statement
" hi link rubyInterPolationDelimiter Statement
" hi link rubyStringDelimiter        Preproc
" hi link rubySymbolDelimiter        Statement
" hi link rubyClass                  Number
" hi link rubyDefine                 Title
" hi link rubyModule                 Number
" hi link rubyPredefinedVariable     Number
" hi link rubyPredefinedConstant     Number
hi link rubyBoolean                Title
hi link rubyPseudoVariable         Title
" hi link rubyOperator               Delimiter
"}}}
" eruby"{{{
" hi link erubyDelimiter   Delimiter
"}}}
" Python"{{{
hi link pythonFunction       Preproc
"}}}
" CoffeeScript"{{{
hi link coffeeObjAssign      Preproc
hi link coffeeBlock          Title
hi link coffeeSpecialIdent   Title
"}}}
" php"{{{
hi link phpParent            Title
" hi link phpIdentifier        Title
"}}}
