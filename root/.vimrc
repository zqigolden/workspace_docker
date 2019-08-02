set encoding=utf-8

"vundle configs
set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
call vundle#end()            " required
filetype plugin indent on    " required

"python configs
syntax on
filetype indent on
:set number
:set et
:set sw =4
:set smarttab
:set autoindent
":set mouse=v
:set mouse=a
highlight Comment ctermfg=green guifg=green
hi String ctermfg = green
hi Type ctermfg   = yellow
hi Number ctermfg = blue

"F5 for running
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc 

"change complete method
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

set pastetoggle=<F11>

map <C-n> :NERDTreeToggle<CR>
