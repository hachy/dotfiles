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
hi LineNr           guifg=#333333  guibg=#060606  gui=NONE
hi Title            guifg=#ADADAD  guibg=NONE     gui=NONE
hi Visual           guifg=#333333  guibg=#9865FF  gui=NONE
"hi VisualNos
hi SpecialKey       guifg=#333366  guibg=#090909  gui=NONE
hi MatchParen       guifg=#FFFFFF  guibg=#333333  gui=bold
hi Cursor           guifg=#000000  guibg=#8EFFC1  gui=NONE
hi CursorLine       guifg=NONE     guibg=#121212  gui=NONE
hi CursorLineNr     guifg=#333333  guibg=#121212  gui=NONE
hi CursorColumn     guifg=NONE     guibg=#121212  gui=NONE
hi Search           guifg=#000000  guibg=#FF6FFF  gui=underline
hi IncSearch        guifg=#000000  guibg=#8EFFC1  gui=NONE
hi ErrorMsg         guifg=#000000  guibg=#8EFFC1  gui=bold
hi WarningMsg       guifg=#000000  guibg=#8EFFC1  gui=bold
hi ModeMsg          guifg=#8EFFC1  guibg=NONE     gui=bold
hi MoreMsg          guifg=#8EFFC1  guibg=NONE     gui=bold
hi Question         guifg=#8EFFC1  guibg=NONE     gui=underline
hi TabLine          guifg=#333333  guibg=NONE     gui=underline
hi TabLineFill      guifg=#333333  guibg=NONE     gui=NONE
hi TabLineSel       guifg=#8EFFC1  guibg=NONE     gui=underline
hi StatusLine       guifg=#8EFFC1  guibg=#121212  gui=underline
hi StatusLineNC     guifg=#555555  guibg=NONE     gui=underline
hi VertSplit        guifg=#333366  guibg=NONE     gui=NONE
hi WildMenu         guifg=#8EFFC1  guibg=NONE     gui=NONE
hi Folded           guifg=#8EC1FF  guibg=#121212  gui=NONE
hi FoldColumn       guifg=#8EC1FF  guibg=#030303  gui=NONE
hi ColorColumn      guifg=NONE     guibg=#333366  gui=NONE
" hi SignColumn       guifg=#FFFFFF  guibg=#121212  gui=NONE
hi Conceal          guifg=#8EFFC1  guibg=NONE     gui=NONE
hi SpellBad         guifg=NONE     guibg=NONE     gui=undercurl  guisp=#FF288E
hi SpellCap         guifg=NONE     guibg=NONE     gui=undercurl  guisp=#FF288E
hi SpellRare        guifg=NONE     guibg=NONE     gui=undercurl  guisp=#FF288E
hi SpellLocal       guifg=NONE     guibg=NONE     gui=undercurl  guisp=#FF288E
hi DiffAdd          guifg=#121212  guibg=#8EC1FF  gui=bold
hi DiffChange       guifg=#121212  guibg=#FF84B7  gui=NONE
hi DiffDelete       guifg=#333366  guibg=NONE     gui=NONE
hi DiffText         guifg=#121212  guibg=#FF288E  gui=bold
hi Pmenu            guifg=#ADADAD  guibg=#333333  gui=NONE
hi PmenuSel         guifg=#121212  guibg=#8EC1FF  gui=NONE
hi PmenuSbar        guifg=NONE     guibg=#121212  gui=NONE
hi PmenuThumb       guifg=NONE     guibg=#8EC1FF  gui=NONE
"}}}
" Syntax highlighting"{{{
hi Comment          guifg=#555555  guibg=NONE     gui=italic
hi String           guifg=#8EFFC1  guibg=NONE     gui=NONE
hi Number           guifg=#FF288E  guibg=NONE     gui=NONE
hi PreProc          guifg=#FF84B7  guibg=NONE     gui=NONE
hi Keyword          guifg=#9865FF  guibg=NONE     gui=NONE
hi Conditional      guifg=#9865FF  guibg=NONE     gui=NONE
hi Function         guifg=#9865FF  guibg=NONE     gui=NONE
hi Statement        guifg=#9865FF  guibg=NONE     gui=NONE
hi Todo             guifg=#FF288E  guibg=NONE     gui=NONE
hi Constant         guifg=#8EC1FF  guibg=NONE     gui=NONE
hi Type             guifg=#8EC1FF  guibg=NONE     gui=NONE
hi Operator         guifg=#8EC1FF  guibg=NONE     gui=NONE
hi Identifier       guifg=#ADADAD  guibg=NONE     gui=NONE
hi Special          guifg=#FF84B7  guibg=NONE     gui=NONE
hi Delimiter        guifg=#FF6FFF  guibg=NONE     gui=NONE
hi Underlined       guifg=#8EFFC1  guibg=NONE     gui=underline
hi Error            guifg=#FF288E  guibg=NONE     gui=underline
hi CursorIM         guifg=NONE     guibg=#FF288E  gui=NONE

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
hi link javaScript           Identifier
"}}}
" XML"{{{
hi link xmlEndTag            Keyword
"}}}
" Javascript"{{{
hi link javaScriptIdentifier         Type
hi link javaScriptDOMMethods         Identifier
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
hi rubyRegexp                      guifg=#FF288E  guibg=NONE  gui=bold
hi rubyRegexpDelimiter             guifg=#FF288E  guibg=NONE  gui=bold
hi link rubyIdentifier             Preproc
hi link rubySymbol                 Delimiter
hi link rubyFunction               Constant
hi link rubyKeyword                Number
hi link rubyClassVariable          Delimiter
hi link rubyInstanceVariable       Delimiter
hi link rubyBlockParameter         Identifier
hi link rubyDelimiter              Statement
hi link rubyInterPolationDelimiter Statement
hi link rubyStringDelimiter        Statement
hi link rubySymbolDelimiter        Statement
hi link rubyClass                  Preproc
hi link rubyDefine                 Preproc
hi link rubyModule                 PreProc
hi link rubyPredefinedVariable     Number
hi link rubyPredefinedConstant     Number
hi link rubyBoolean                Delimiter
hi link rubyOperator               Delimiter
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
hi link coffeeBlock          Identifier
"}}}
