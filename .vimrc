let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
call plug#end()

set autochdir 
set tabstop=4
set shiftwidth=4
