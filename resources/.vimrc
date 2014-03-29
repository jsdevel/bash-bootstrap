syntax on

set hlsearch
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set number
"set paste
set colorcolumn=85
set background=dark
let mapleader=','

"Key Mapping
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-i> <C-w><C-w>
noremap <leader>l <C-w>>
noremap <leader>h <C-w><
noremap <leader>k <C-w>+
noremap <leader>j <C-w>-

"Whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"bootstrap plugins
execute pathogen#infect()

"plugin configuration
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=0
let g:syntastic_ignore_files = ['.\+\.json$']
let g:syntastic_javascript_jshint_conf = '~/.bash-bootstrap/resources/.jshintrc-local'
let NERDTreeShowHidden=1
