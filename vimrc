" Install Pathogen
execute pathogen#infect()

" General Settings
syntax on
filetype plugin indent on

" Open Nerdtree when opening a directory
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$','\.swp$','\.swo']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'set splitbelow' | exe 'term' | exe 'resize 24' | endif

" Close Nerdtree when all files are closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Color Settings
set background=dark

" Ansible Settings
au BufRead,BufNewFile */ansible/*.yml set filetype=ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=ansible

" Jenkins Settings
au BufRead,BufNewFile */*.jf set filetype=groovy

" Vim-go Settings
let g:go_version_warning = 0
au BufRead,BufNewFile *.go nnoremap - :GoRun<CR>

" Python Settings
au BufRead,BufNewFile reqs.txt nnoremap - :!pip install -r reqs.txt <CR>
au BufRead,BufNewFile *.py nnoremap - :term python %<CR>
au BufRead,BufNewFile test*.py nnoremap - :term pytest -v %<CR>

" Backspace enabled
set bs=2

" Line Numbers
set number

" Lightline
set laststatus=2
set noshowmode

" Reload vimrc on save
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
