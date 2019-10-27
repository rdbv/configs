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

function! WriteFIFO(command, fifo)
    execute '!' . 'echo -ne "' . a:command . '" > ' . a:fifo 
endfunction

function! CompileFile()
    let name = expand('%:t')
    execute '!' . 'make -B ' . name 
endfunction

function! CompileFileFIFO()
    "let name = expand('%:t:r')
    let name = expand('%:t')
    execute '!' . 'echo "make -B ' . name . '" > cmd'
endfunction

function! RunFIFO()
    "let name = expand('%:t:r')
    execute '!' . 'echo "make -B run" > cmd'
endfunction

function! FlashFIFO()
    let cmd = './main'
    execute '!echo "' . cmd . '" > fifo'
endfunction

function! JustMake()
    execute '!' . 'clear; make -B main'
endfunction

function! RunFileInNewWindow(name)
    let command = 'xterm -bg black -fg gray -geometry 90x80 -e "' . "./" . a:name . ';echo "...";read' . '"'
    execute '!' . command
endfunction

function! RunPythonScript()
    let name = expand('%')
    execute '!' . 'clear; python3 ' . name
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

inoremap <c-e> <esc> :call RunPythonScript() <cr>
nnoremap <c-e> :call RunPythonScript() <cr>

" Helper mappings
"inoremap <c-l> <esc> :call CompileFileFIFO() <cr>
"nnoremap <c-l> :call CompileFileFIFO() <cr>

inoremap <c-k> <esc> :call WriteFIFO('make -B ' . expand('%:t') , 'cmd') <cr>
nnoremap <c-k> :call WriteFIFO('make -B ' . expand('%:t') , 'cmd') <cr>

inoremap <c-l> <esc> :call WriteFIFO('make -B burn', 'cmd') <cr>
nnoremap <c-l> :call WriteFIFO('make -B burn', 'cmd') <cr>

"inoremap <c-l> <esc> :!./flash.py -c /dev/ttyUSB0 -f "main.py index.html"<cr>
"nnoremap <c-l> :!./flash.py -c /dev/ttyUSB0 -f "main.py index.html"<cr>

"inoremap <c-n> <esc> :call FlashFIFO() <cr>
"nnoremap <c-n> :call FlashFIFO() <cr>

inoremap <c-x> <esc> :!python3 % <cr>
nnoremap <c-x> :!python3 % <cr>

"inoremap <c-m> :! clear; echo 'clear; make -B' > cmd <cr>
"nnoremap <c-m> :! clear; echo 'clear; make -B' > cmd <cr>

"inoremap <c-m> :! clear; echo 'clear; ./build/main' > cmd <cr>
"nnoremap <c-m> :! clear; echo 'clear; ./build/main' > cmd <cr>
 
inoremap <f9> :! clear; make -B run <cr>
nnoremap <f9> :! clear; make -B run <cr>

inoremap <f10> :call CompileFile()<cr>
nnoremap <f10> :call CompileFile()<cr>

inoremap <F12> :! clear; make -B run<cr>
nnoremap <F12> :! clear; make -B run<cr>


inoremap <Leader>k <esc> :call RunFileInNewWindow("build/main") <cr>
nnoremap <Leader>k :call RunFileInNewWindow("build/main") <cr>


