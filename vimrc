" Vim Configuration

" *********************************************
" Vundle setting
" *********************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'davidhalter/jedi-vim'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'isnowfy/python-vim-instant-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" *********************************************
" Base configuration
" *********************************************
" Syntax highlight
let python_highlight_all=1
syntax on
" <leader> mapping '\' -> ','
let mapleader=","
" Mouse mode
set mouse=a
set mousehide
set selection=exclusive
set selectmode=mouse,key
" Search setting
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set hlsearch
" Indent
set cindent
set autoindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
" Others
set number
set nojoinspaces
set hidden
set wrap
set ruler
set cursorline
set foldmethod=indent
"set foldlevel=99
"set colorcolumn=81
"highlight ColorColumn ctermbg=33
set encoding=utf-8
set nobackup
set noswapfile
set clipboard=unnamed " share clipboard with cmd
set backspace=2

" *********************************************
" Layout
" *********************************************
set splitbelow
set splitright
" Shortcuts to switch different windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" *********************************************
" Code fold
" *********************************************
set foldmethod=indent
set foldlevel=99
" Shortcut
nnoremap <space> za

" *********************************************
" NERDTree
" *********************************************
"autocmd vimenter * NERDTree   " Open NERDTree while launch vim
map <leader>tr :NERDTreeToggle<CR>  " Shortcut

" *********************************************
" Tagbar
" *********************************************
let g:tagbar_auto_focus =1
map <leader>tt :TagbarToggle<CR>
" Open Tagbar while open a file of these types
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" *********************************************
" YouCompleteMe
" *********************************************
" Default configuration file
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
let g:ycm_python_binary_path = 'python'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=0
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_complete_in_strings=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_trigger = 1
let g:ycm_collect_identifiers_from_tags_files=1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" Shortcuts
inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<CR>'
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'
" Jump functions
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" *********************************************
" vim-airline
" *********************************************
" powerline font
let g:airline_powerline_fonts = 1
"set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set guifont=Consolas\ for\ Powerline\ FixedD:h11
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#whitespace#symbol = '!'
" Shortcuts to swith buffers
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
" input <leader>num to specified buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" *********************************************
" ctrlp
" *********************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" ignore suffix
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

" *********************************************
" jedi-vim
" *********************************************
let g:jedi#use_splits_not_buffers = "top"
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#completions_enabled = 0
"let g:jedi#goto_command            = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#documentation_command    = "K"
let g:jedi#usages_command           = "<leader>n"
let g:jedi#completions_command      = "<S-Space>"
let g:jedi#rename_command           = "<leader>r"

" *********************************************
" Markdown
" *********************************************
map <leader>md :Instantmd<CR>  " Preview Shortcut

" *********************************************
" Color-theme
" *********************************************
syntax enable
set t_Co=256
"let g:solarized_termcolors=256
"colorscheme desert
colorscheme solarized

" *********************************************
" Format
" *********************************************
au BufNewFile,BufRead *.py
\set tabstop=4
\set softtabstop=4
\set shiftwidth=4
\set textwidth=79
\set expandtab
\set autoindent
\set fileformat=unix

" *********************************************
" Create new file: insert file head
" *********************************************
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
" Function SetTitle
func SetTitle()
 if &filetype == 'sh'
  call setline(1,"\#!/bin/bash")
  call append(line("."), "")
 elseif &filetype == 'python'
  call setline(1,"#!/usr/bin/env python")
  call append(line("."),"# -*- coding:utf8 -*-")
  call append(line(".")+1, "")
 else
  call setline(1, "/*************************************************************************")
  call append(line("."), " > File Name: ".expand("%"))
  call append(line(".")+1, " > Author: ")
  call append(line(".")+2, " > Mail: ")
  call append(line(".")+3, " > Created Time: ".strftime("%c"))
  call append(line(".")+4, " ************************************************************************/")
  call append(line(".")+5, "")
 endif

 if expand("%:e") == 'cpp'
  call append(line(".")+6, "#include<iostream>")
  call append(line(".")+7, "using namespace std;")
  call append(line(".")+8, "")
 endif
 if &filetype == 'c'
  call append(line(".")+6, "#include<stdio.h>")
  call append(line(".")+7, "")
 endif
 if expand("%:e") == 'h'
  call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
  call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
  call append(line(".")+8, "#endif")
 endif
endfunc
" After creating new file, go to the end of the file
autocmd BufNewFile * normal G

" *********************************************
" Ctrl+B: compile and run
" *********************************************
map <C-B> :call CompileRunGcc()<CR>
func! CompileRunGcc()
 exec "w"
 if &filetype == 'c'
  exec "!g++ % -o %<"
  exec "!time ./%<"
 elseif &filetype == 'cpp'
  exec "!g++ % -o %<"
  exec "!time ./%<"
 elseif &filetype == 'sh'
  exec "!time bash %"
 elseif &filetype == 'python'
  exec "!time python %"
 endif
endfunc
