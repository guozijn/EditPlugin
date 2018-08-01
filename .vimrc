" default
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set hlsearch
set autoread
set nu
filetype plugin indent on
let mapleader=";"
"set ts=2
"set expandtab
"set smartindent

" leader key +
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nnoremap <Leader>l <C-W>l
nnoremap <Leader>h <C-W>h
nnoremap <Leader>k <C-W>k
nnoremap <Leader>j <C-W>j

" NERDTree
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :bn<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Vundle
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'nerdtree'
Plugin 'Syntastic'
Plugin 'vim-flake8'
"Plugin 'YouCompleteMe'
Plugin 'nerdtree-git-plugin'
Plugin 'vim-airline'
Plugin 'vim-airline-themes'
Plugin 'ctrlp.vim'
Plugin 'vim-bracketed-paste'
Plugin 'vim-markdown'
Plugin 'vim-instant-markdown'
call vundle#end()

" python
let python_highlight_all=1
let g:ycm_python_binary_path = 'python'
autocmd FileType python map <buffer> <F5> :call Flake8()<CR>

" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" auto python header
function HeaderPython()
call setline(1, "#!/usr/bin/env python")
call append(1, "#-*- coding:utf8 -*-")
normal G
normal o
endf
autocmd bufnewfile *.py call HeaderPython()

" auto bash header
function HeaderBash()
call setline(1, "#!/bin/bash")
normal G
normal o
endf
autocmd bufnewfile *.sh call HeaderBash()

" cursor
set cursorcolumn
set cursorline
highlight CursorLine cterm=NONE ctermbg=235 ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=235 ctermfg=NONE guibg=NONE guifg=NONE

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_solarized_bg='dark'

" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
