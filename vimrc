call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'tpope/vim-fugitive'
call plug#end()


let base16colorspace=256
colorscheme base16-default-dark

set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
