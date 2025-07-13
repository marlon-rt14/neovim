
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>Q :q!<CR>
nmap <Leader>W :wq<CR>
"Copiar al portapapeles desde nvim"
vnoremap <C-Y> :'<,'>w !xclip -selection clipboard<CR>
"vnoremap <C-Y> :'<,'>w !echo -n "\%V" | xclip -selection clipboard<CR>

" Suprimir una palabra adelante desde el cursor con: ctrl + spr
inoremap <C-Del> <C-o>dw

" Eliminar una palabra hacia atras desde el cursor con: ctrl + del
inoremap <Char-8> <C-W>

"Saltar una linea abajo sin separar la linea actual: ctrl + enter 
imap <C-L> <C-o>o

"Duplicar la lina actual"
" nmap <Leader>d :t.<CR>
"nmap <M-d> :t.<CR>
nnoremap <M-d> :<C-u>normal! yyp<CR>
inoremap <M-d> <C-o>:<C-u>normal! yyp<CR>

"Configuracion de pestanias"
noremap <A-j> :tabprevious<CR>
noremap <A-k> :tabnext<CR>
noremap <A-h> :tabfirst<CR>
noremap <A-l> :tablast<CR>
noremap <A-w> :tabclose<CR>

" Buffers
nmap <Leader>n :bnext<CR>
nmap <Leader>p :bprev<CR>
nmap <Leader>x :bdelete<CR>
" nmap <Leader>l :ls<CR>
" nmap <Leader>bb :buffers<CR>
"
" Ver archivos .json
nnoremap <leader>tc :call ToggleConcealLevel()<CR>

function! ToggleConcealLevel()
  if &conceallevel == 0
    setlocal conceallevel=1
    echo "Conceallevel set to 1 (ocultar comillas)"
  else
    setlocal conceallevel=0
    echo "Conceallevel set to 0 (mostrar comillas)"
  endif
endfunction
