" Load plugins
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ycm-core/YouCompleteMe'
call plug#end()


" Colorscheme
set termguicolors
set background=dark
colorscheme solarized

" Basics
set number relativenumber
set encoding=utf-8
set wildmode=longest,list,full
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set splitbelow splitright
filetype plugin on
set tabstop=4
set shiftwidth=4

" NERDTree
map <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" YCM
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'

" Remaps
autocmd FileType json inoremap [ [<CR>]<Esc>ko
autocmd FileType html inoremap < <><Esc>i
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
inoremap { {<CR>}<Esc>ko
inoremap [ []<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i


