" Install Pathogen
execute pathogen#infect()

" General Settings
syntax on
filetype plugin indent on

" Nerdtree Settings

" Open Nerdtree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close Nerdtree when all files are closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Color Settings
set background=dark

" Ansible Settings
au BufRead,BufNewFile */ansible/*.yml set filetype=ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=ansible

" Vim-go Settings
let g:go_version_warning = 0
nnoremap - :GoRun<CR>

" Status Line
set statusline=%f
