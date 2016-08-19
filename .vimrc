set nocompatible 
filetype indent plugin on
syntax on
colorscheme slate
set number
set shiftwidth=4
set expandtab
set tabstop=4
set noswapfile

let mapleader = ','

function! CompileFile()
    let name = expand('%:t:r')
    execute '!' . 'make -B ' . name
endfunction

function! RunFileInNewWindow(name)
    let command = 'xterm -e "' . "./" . a:name . ';read;' . '"'
    execute '!' . command
endfunction

" Basic mappings
inoremap <c-w> <esc> :w <cr>
nnoremap <c-w> :w <cr> 

inoremap <c-u> <esc> :tabp <cr>
nnoremap <c-u> :tabp <cr>

inoremap <c-o> <esc> :tabn <cr>
nnoremap <c-o> :tabn <cr>

inoremap <c-p> <esc> :tabnew <cr>
nnoremap <c-p> :tabnew <cr>

inoremap <Leader>se <esc> :so $MYVIMRC <cr>
nnoremap <Leader>se :so $MYVIMRC <cr>

inoremap <c-l> <esc> :!xterm -e 'python3 %;read;' <cr>
nnoremap <c-l> :!xterm -e 'python3 %;read' <cr>

" Helper mappings
inoremap <c-k> <esc> :call CompileFile() <cr>
nnoremap <c-k> :call CompileFile() <cr>

inoremap <Leader>k <esc> :call RunFileInNewWindow("main") <cr>
nnoremap <Leader>k :call RunFileInNewWindow("main") <cr>

