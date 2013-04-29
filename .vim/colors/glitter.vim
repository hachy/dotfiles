" Vim color file
" Name   :  glitter
" Author :  8th

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "glitter"

" General colors"{{{
hi Normal           guifg=#A8A8A8  guibg=#080808  gui=NONE       ctermfg=248   ctermbg=NONE  cterm=NONE
hi NonText          guifg=#080808  guibg=NONE     gui=NONE       ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Directory        guifg=#5FAFD7  guibg=NONE     gui=NONE       ctermfg=74    ctermbg=NONE  cterm=NONE
hi LineNr           guifg=#444444  guibg=#121212  gui=NONE       ctermfg=238   ctermbg=233   cterm=NONE
hi Title            guifg=#D75FAF  guibg=NONE     gui=NONE       ctermfg=169   ctermbg=NONE  cterm=NONE
hi Visual           guifg=#AF87D7  guibg=#5F5F87  gui=NONE       ctermfg=140   ctermbg=60    cterm=NONE
hi SpecialKey       guifg=#5F5F87  guibg=#121212  gui=NONE       ctermfg=60    ctermbg=233   cterm=NONE
hi MatchParen       guifg=#FFFFFF  guibg=#444444  gui=bold       ctermfg=15    ctermbg=238   cterm=bold
hi Cursor           guifg=#000000  guibg=#87FFAF  gui=NONE       ctermfg=0     ctermbg=121   cterm=NONE
hi CursorLine       guifg=NONE     guibg=#1C1C1C  gui=NONE       ctermfg=NONE  ctermbg=234   cterm=NONE
hi CursorLineNr     guifg=#666666  guibg=#1C1C1C  gui=bold       ctermfg=242   ctermbg=234   cterm=bold
hi CursorColumn     guifg=NONE     guibg=#1C1C1C  gui=NONE       ctermfg=NONE  ctermbg=234   cterm=NONE
hi Search           guifg=#000000  guibg=#875FD7  gui=underline  ctermfg=0     ctermbg=98    cterm=underline
hi IncSearch        guifg=#000000  guibg=#87FFAF  gui=NONE       ctermfg=0     ctermbg=121   cterm=NONE
hi ErrorMsg         guifg=#000000  guibg=#87FFAF  gui=bold       ctermfg=0     ctermbg=121   cterm=bold
hi WarningMsg       guifg=#000000  guibg=#87FFAF  gui=bold       ctermfg=0     ctermbg=121   cterm=bold
hi ModeMsg          guifg=#87FFAF  guibg=NONE     gui=bold       ctermfg=121   ctermbg=NONE  cterm=bold
hi MoreMsg          guifg=#87FFAF  guibg=NONE     gui=bold       ctermfg=121   ctermbg=NONE  cterm=bold
hi Question         guifg=#87FFAF  guibg=NONE     gui=underline  ctermfg=121   ctermbg=NONE  cterm=underline
hi TabLine          guifg=#666666  guibg=#1C1C1C  gui=NONE       ctermfg=242   ctermbg=234   cterm=NONE
hi TabLineFill      guifg=#666666  guibg=#1C1C1C  gui=NONE       ctermfg=242   ctermbg=234   cterm=NONE
hi TabLineSel       guifg=#87FFAF  guibg=NONE     gui=NONE       ctermfg=121   ctermbg=NONE  cterm=NONE
hi StatusLine       guifg=#87FFAF  guibg=#444444  gui=NONE       ctermfg=121   ctermbg=238   cterm=NONE
hi StatusLineNC     guifg=#666666  guibg=NONE     gui=underline  ctermfg=242   ctermbg=NONE  cterm=underline
hi VertSplit        guifg=#5F5F87  guibg=NONE     gui=NONE       ctermfg=60    ctermbg=NONE  cterm=NONE
hi WildMenu         guifg=#87FFAF  guibg=NONE     gui=NONE       ctermfg=121   ctermbg=NONE  cterm=NONE
hi Folded           guifg=#5FAFD7  guibg=#1C1C1C  gui=NONE       ctermfg=74    ctermbg=234   cterm=NONE
hi FoldColumn       guifg=#5FAFD7  guibg=#080808  gui=NONE       ctermfg=74    ctermbg=NONE  cterm=NONE
hi ColorColumn      guifg=NONE     guibg=#5F5F87  gui=NONE       ctermfg=NONE  ctermbg=60    cterm=NONE
" hi SignColumn       guifg=#FFFFFF  guibg=#1C1C1C  gui=NONE
hi Conceal          guifg=#87FFAF  guibg=NONE     gui=NONE       ctermfg=121   ctermbg=NONE  cterm=NONE
hi SpellBad         guifg=NONE     guibg=NONE     gui=undercurl  ctermfg=125   ctermbg=NONE  cterm=underline  guisp=#AF005F
hi SpellCap         guifg=NONE     guibg=NONE     gui=undercurl  ctermfg=125   ctermbg=NONE  cterm=underline  guisp=#AF005F
hi SpellRare        guifg=NONE     guibg=NONE     gui=undercurl  ctermfg=125   ctermbg=NONE  cterm=underline  guisp=#AF005F
hi SpellLocal       guifg=NONE     guibg=NONE     gui=undercurl  ctermfg=125   ctermbg=NONE  cterm=underline  guisp=#AF005F
hi DiffAdd          guifg=#1C1C1C  guibg=#5FAFD7  gui=NONE       ctermfg=234   ctermbg=74    cterm=NONE
hi DiffChange       guifg=#1C1C1C  guibg=#D75FAF  gui=NONE       ctermfg=234   ctermbg=169   cterm=NONE
hi DiffDelete       guifg=#5F5F87  guibg=NONE     gui=NONE       ctermfg=60    ctermbg=NONE  cterm=NONE
hi DiffText         guifg=#1C1C1C  guibg=#AF005F  gui=NONE       ctermfg=234   ctermbg=125   cterm=NONE
hi Pmenu            guifg=#A8A8A8  guibg=#444444  gui=NONE       ctermfg=248   ctermbg=238   cterm=NONE
hi PmenuSel         guifg=#1C1C1C  guibg=#5FAFD7  gui=NONE       ctermfg=234   ctermbg=74    cterm=NONE
hi PmenuSbar        guifg=NONE     guibg=#1C1C1C  gui=NONE       ctermfg=NONE  ctermbg=234   cterm=NONE
hi PmenuThumb       guifg=NONE     guibg=#5FAFD7  gui=NONE       ctermfg=NONE  ctermbg=74    cterm=NONE
"}}}
" Syntax highlighting"{{{
hi Comment          guifg=#666666  guibg=NONE     gui=italic     ctermfg=242   ctermbg=NONE  cterm=NONE
hi String           guifg=#87FFAF  guibg=NONE     gui=NONE       ctermfg=121   ctermbg=NONE  cterm=NONE
hi Number           guifg=#AF005F  guibg=NONE     gui=NONE       ctermfg=125   ctermbg=NONE  cterm=NONE
hi PreProc          guifg=#D75FAF  guibg=NONE     gui=NONE       ctermfg=169   ctermbg=NONE  cterm=NONE
hi Keyword          guifg=#875FD7  guibg=NONE     gui=NONE       ctermfg=98    ctermbg=NONE  cterm=NONE
hi Conditional      guifg=#875FD7  guibg=NONE     gui=NONE       ctermfg=98    ctermbg=NONE  cterm=NONE
hi Function         guifg=#875FD7  guibg=NONE     gui=NONE       ctermfg=98    ctermbg=NONE  cterm=NONE
hi Statement        guifg=#875FD7  guibg=NONE     gui=NONE       ctermfg=98    ctermbg=NONE  cterm=NONE
hi Todo             guifg=#AF005F  guibg=NONE     gui=NONE       ctermfg=125   ctermbg=NONE  cterm=NONE
hi Constant         guifg=#5FAFD7  guibg=NONE     gui=NONE       ctermfg=74    ctermbg=NONE  cterm=NONE
hi Type             guifg=#5FAFD7  guibg=NONE     gui=NONE       ctermfg=74    ctermbg=NONE  cterm=NONE
hi Operator         guifg=#5FAFD7  guibg=NONE     gui=NONE       ctermfg=74    ctermbg=NONE  cterm=NONE
hi Identifier       guifg=#AF87D7  guibg=NONE     gui=NONE       ctermfg=140   ctermbg=NONE  cterm=NONE
hi Special          guifg=#D75FAF  guibg=NONE     gui=NONE       ctermfg=169   ctermbg=NONE  cterm=NONE
hi Delimiter        guifg=#AF005F  guibg=NONE     gui=NONE       ctermfg=125   ctermbg=NONE  cterm=NONE
hi Underlined       guifg=#87FFAF  guibg=NONE     gui=underline  ctermfg=121   ctermbg=NONE  cterm=underline
hi Error            guifg=#AF005F  guibg=NONE     gui=underline  ctermfg=125   ctermbg=NONE  cterm=underline
hi CursorIM         guifg=NONE     guibg=#AF005F  gui=NONE       ctermfg=NONE  ctermbg=125   cterm=NONE

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
hi link javaScript           Normal
"}}}
" XML"{{{
hi link xmlEndTag            Keyword
"}}}
" Javascript"{{{
hi link javaScriptIdentifier         Type
hi link javaScriptDOMMethods         Normal
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
hi rubyRegexp                      guifg=#AF005F  guibg=NONE  gui=bold       ctermfg=125  ctermbg=NONE  cterm=bold
hi rubyRegexpDelimiter             guifg=#AF005F  guibg=NONE  gui=bold       ctermfg=125  ctermbg=NONE  cterm=bold
hi rubyIdentifier                  guifg=#A8A8A8  guibg=NONE  gui=bold       ctermfg=248  ctermbg=NONE  cterm=bold
hi link rubyConstant               Constant
hi link rubyFunction               Constant
hi link rubyKeyword                Number
hi link rubySymbol                 Identifier
hi link rubyInstanceVariable       Identifier
" hi link rubyClassVariable          Delimiter
hi link rubyBlockParameter         Normal
" hi link rubyDelimiter              Statement
" hi link rubyInterPolationDelimiter Statement
" hi link rubyStringDelimiter        Preproc
" hi link rubySymbolDelimiter        Statement
" hi link rubyClass                  Number
" hi link rubyDefine                 Normal
" hi link rubyModule                 Number
" hi link rubyPredefinedVariable     Number
" hi link rubyPredefinedConstant     Number
hi link rubyBoolean                Normal
hi link rubyPseudoVariable         Normal
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
hi link coffeeBlock          Normal
hi link coffeeSpecialIdent   Normal
"}}}
" php"{{{
hi link phpParent            Normal
" hi link phpIdentifier        Normal
"}}}
