execute pathogen#infect()
syntax on
filetype plugin indent on 
set number relativenumber hls

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"

"format .py with black on :w
autocmd BufWritePre *.py execute ':Black'

let g:rustfmt_autosave = 1
"let g:vim_markdown_folding_level = 6
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1
let vim_markdown_preview_github=1
let g:vim_markdown_preview_browser='chromium'

"spellchecking
"au BufReadPost,BufNewFile *.md,*.txt,*.tex,*.htf setlocal spell
au BufReadPost,BufNewFile *.tex,*.htf setlocal spell


nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <C-c> "+yy

let g:NERDTreeWinPos = "right"

set showcmd

"highlight htfheadings ctermfg=red guifg=#00ffff
"highlight htfformat ctermfg=blue guifg=#00ffff
"highlight SpellCap ctermfg=white guifg=#00ffff
"highlight htfends ctermfg=red guifg=#00ffff

""""""auto set paste/nopaste when pasting if tmux
"function! WrapForTmux(s)
"  if !exists('$TMUX')
"    return a:s
"  endif
"
"  let tmux_start = "\<Esc>Ptmux;"
"  let tmux_end = "\<Esc>\\"
"
"  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
"endfunction
"
"let &t_SI .= WrapForTmux("\<Esc>[?2004h")
"let &t_EI .= WrapForTmux("\<Esc>[?2004l")
"
"function! XTermPasteBegin()
"  set pastetoggle=<Esc>[201~
"  set paste
"  return ""
"endfunction
"
"inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"""""""""""""""""

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

"use 2spaces for indent instead of tabs
set tabstop=2
set shiftwidth=2
set expandtab
