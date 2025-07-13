
"vim-prettier formatear documento"
nnoremap <Leader>fa :Prettier<CR>:w<CR>
vnoremap <Leader>ff :PrettierFragment<CR>:w<CR>
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0
"let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = &softtabstop
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#bracket_spacing = 'false'
"Formatear el codigo"
"inoremap <A-f><A-f> <Esc>:call feedkeys(":Prettier\<CR>")<CR>
inoremap <A-f><A-f> <Esc>:execute "Prettier"<CR>a
nnoremap <A-f><A-f> :Prettier<CR>
