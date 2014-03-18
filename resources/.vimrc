"Added by bash-bootstrap on "Tue Mar 18 01:56:04 MST 2014"
set expandtab

" Be smart when using tabs ;)
set smarttab
"
" " 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2
"
" " Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set number
"set paste
set colorcolumn=85
execute pathogen#infect()
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=0
