"=======================================
"           initialization
"=======================================
syntax on
set nocompatible  "set nocp
filetype off      "required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required
"Keep Plugin commands between vundle#begin/end
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on

let g:NERDTreeDirArrowExpandable = '📂'
let g:NERDTreeDirArrowCollapsible = '📁'
let g:ycm_auto_trigger = 1
"=======================================
"         environment variable
"=======================================
set ts=4
set ruler
set expandtab
set number        "set nu
set shiftwidth=4  "set sw=4
set showmode
set ignorecase    "set ic
set emoji
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
set completeopt-=preview

"=======================================
"              functions
"=======================================
function! RemoveTrailSpaces()
  " set the cursor position
  let l:l = line('.')
  let l:c = col('.')
  %s/\s*$//g
  " restore cursor position
  call cursor(l,c)
endfunction

function! CheckSpell()
  "call shell command spell
  :$r !spell %
endfunction

"=======================================
"               mappings
"=======================================
:map <C-n> :NERDTreeToggle<CR>

"=======================================
"            auto command
"=======================================
autocmd FileType make setlocal noexpandtab "don't expand tab if is Makefile
autocmd VimEnter *.{h,hh,hpp,c,cc,cpp,go,js,py,rb,java} NERDTree | wincmd p
autocmd BufWritePre *.{h,hh,hpp,c,cc,cpp,go,js,py,rb,java} call RemoveTrailSpaces()
autocmd VimLeavePre * if exists("t:NERDTreeBufName") | exe "NERDTreeClose" | endif
