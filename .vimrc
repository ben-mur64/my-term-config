"------------------------Plugins---------------------------"

" turn off vi compatibility
set nocompatible
filetype off

" set the runtime path to inclue Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" simple folding for function/class/method/etc
Plugin 'tmhedberg/SimpylFold'

" more python indentation fixing
Plugin 'vim-scripts/indentpython.vim'

" best python autocomplete plugin
Bundle 'Valloric/YouCompleteMe'

" syntax checking/highlighting
Plugin 'vim-syntastic/syntastic'

" PEP8 checking (may be buggy)
Plugin 'nvie/vim-flake8'

" file tree browsing
Plugin 'scrooloose/nerdtree'

" tabs for the file tree
Plugin 'jistr/vim-nerdtree-tabs'

" ctrl-p super search
Plugin 'kien/ctrlp.vim'

" Colorscheme
Plugin 'altercation/vim-colors-solarized'

" All plugins must be before this line
call vundle#end()
filetype plugin indent on

"-------------------Plugin-Specific------------------------"

" SimpylFold "
" Enable function/class/method folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" YouCompleteMe "
" closes the autocomplete window when done
let g:ycm_autoclose_preview_window_after_completion=1

" defines a shortcut for goto defintion
map <leader>g  :YcomCompleter GoToDefinitionElseDeclaration<CR>

" NerdTree "
" ctrl-n opens filetree
map <C-n> :NERDTreeToggle<CR>

" Colors "
" colorscheme enabling
syntax enable
set background=dark
colorscheme solarized

"------------------Filetype-Specific-----------------------"

" Python "
" get Python autoindent working
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" marks extra whitespace as bad in python files
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" python with virtualenv support (may be buggy)
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.paht.join(project_base_dir, 'bin/activate_this.py')
	exec(open(activate_this, "rb").read(), activate_this, 'exec'),
EOF

" turn on highlighting
let python_highlight_all=1
syntax on

" Web Files "
" full stack development tab completion
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Markdown/Text "
" turn on spellchecker on markdown and txt files
au BufNewFile,BufRead *.md, *.txt 
    \ set spell

"-------------------Quality-of-Life------------------------"

" split navigation, ctrl + movement to change splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" show line number
set number

" sets UTF8 encoding
set encoding=utf-8

" number of visual spaces per TAB
set tabstop=4

" number of space in TAB when editing
set softtabstop=4

" tabs are spaces
set expandtab

" f8 turns off auto-indenting
:nnoremap <F8> :setl noai nocin nosi inde=<CR>

" jj is escape
inoremap jj <esc>
