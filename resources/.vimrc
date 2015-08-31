"Start Vundle Configuration
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on
"End Vundle Configuration

syntax on
filetype on

set exrc
set secure
set autowriteall
set hlsearch
set expandtab
set smarttab
set smartindent
set shiftwidth=2
set tabstop=2
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


set number
set updatetime=1200
set nopaste
set colorcolumn=85
set background=dark
let mapleader=','

"Key Mapping
noremap <C-n> :NERDTree<CR>

noremap <C-Right> <C-w>H
noremap <C-Down> <C-w>J
noremap <C-Up> <C-w>K
noremap <C-Left> <C-w>L

noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-l> <C-w><C-l>
noremap <leader>c :let @/ = ""<CR>
noremap <leader>e :call ToggleErrors()<CR>
noremap <leader>f :tab split<CR>
noremap <leader>F :tabc<CR>
noremap <leader>g :rightb wincmd f<CR>
noremap <leader>G :abo wincmd f<CR>
noremap <leader>l <C-w>>
noremap <leader>h <C-w><
noremap <leader>j <C-w>-
noremap <leader>k <C-w>+
noremap <leader>n :call HandleNumberSetting()<CR>
noremap <leader>p :call HandlePasteSetting()<CR>
noremap <leader>q :q<CR>
noremap <leader>s :wa<CR>
noremap <leader>t :call TidyFoo()<CR>
noremap <leader>z :call SaveAndSuspend()<CR>
noremap <leader>x :xa <CR>

function! SaveAndSuspend()
  :wa
  :sus
endfunction

function! HandleNumberSetting()
  if &number
    set nonumber
  else
    set number
  endif
endfunction

function! HandlePasteSetting()
  if &paste
    set nopaste
  else
    set paste
  endif
endfunction

function! TidyFoo()
  let filename = expand('%:p')
  python << EOF
import vim
from subprocess import call
call(["tidy", "-iqm", "--show-errors", "0", "--show-warnings", "0", "--tidy-mark", "0", vim.eval("expand('%:p')")])
EOF
  :e
endfunction

function! ToggleErrors()
  if exists("w:syntastic_error_loc_list_is_showing") && w:syntastic_error_loc_list_is_showing
    :lclose
    let w:syntastic_error_loc_list_is_showing = 0
  else
    let w:syntastic_error_loc_list_is_showing = 1
    :Errors
  endif
endfunction

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

"plugin configuration
let g:syntastic_always_populate_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=0
let g:syntastic_enable_signs=0
"let g:syntastic_ignore_files = ['.\+\.json$']
let g:syntastic_javascript_jshint_conf = '~/.bash-bootstrap/resources/.jshintrc-local'
let NERDTreeAutoDeleteBuffer=1
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
let g:gitgutter_max_signs=10000
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
