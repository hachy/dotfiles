" Sinatra
au BufNewFile,BufRead *.rb set filetype=ruby | unlet b:current_syntax | syn include @rubyData syntax/haml.vim | syn region rubyDataHaml matchgroup=rubyData start="^__END__$" keepend end="\%$" contains=@rubyData | syn match inFileTemplateName "^@@\w\+" containedin=rubyData | hi def link inFileTemplateName Type
