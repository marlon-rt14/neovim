
" Configuración de toggleterm.nvim en Vimscript
lua << EOF
require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],  -- Atajo para abrir/cerrar (Ctrl + \)
  hide_numbers = true,       -- Oculta números de línea
  shade_terminals = true,    -- Sombreado en el fondo
  start_in_insert = true,    -- Comienza en modo inserción
  direction = "float",       -- Modo flotante por defecto
  close_on_exit = true,      -- Cierra al salir del proceso
  float_opts = {
    border = "curved",       -- Borde curvo
  },
})
EOF

"Terminal flotante"
nnoremap <leader>tt :ToggleTerm<CR>
"nnoremap <leader>th :ToggleTerm size=15 direction=horizontal<CR>  ""Terminal horizontal"
"nnoremap <leader>tv :ToggleTerm size=50 direction=vertical<CR>    "" Terminal vertical"

" Atajo para lazygit (si lo tienes instalado)"
command! LazyGit lua require('toggleterm.terminal').Terminal:new({cmd = "lazygit", direction = "float", float_opts = {border = "double"}}):toggle()
nnoremap <leader>lg :LazyGit<CR>

" Mapeos para navegar en modo terminal "
tnoremap <Esc> <C-\><C-n>          " Salir del modo terminal con Esc"
tnoremap <C-h> <C-\><C-n><C-w>h    " Moverse a ventana izquierda"
tnoremap <C-j> <C-\><C-n><C-w>j    " Moverse a ventana abajo"
tnoremap <C-k> <C-\><C-n><C-w>k    " Moverse a ventana arriba"
tnoremap <C-l> <C-\><C-n><C-w>l    " Moverse a ventana derecha"

"Opcional: Asegurarse de que los plugins se instalen al iniciar "
if empty(glob('~/.vim/plugged/toggleterm.nvim'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
