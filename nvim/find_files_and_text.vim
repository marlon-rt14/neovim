
lua << EOF
require('telescope').setup {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = { height = 0.95, width = 0.95 },
    --mappings = {
    --  i = {  -- Modo insert
    --    ["<C-k>"] = require('telescope.actions').preview_scrolling_up,
    --    ["<C-j>"] = require('telescope.actions').preview_scrolling_down,
    --  },
    --  n = {  -- Modo normal
    --    ["<C-k>"] = require('telescope.actions').preview_scrolling_up,
    --    ["<C-j>"] = require('telescope.actions').preview_scrolling_down,
    --  },
    --},
  },
  pickers = {
    find_files = {
      -- Busca solo en el directorio de trabajo actual
      cwd = vim.fn.getcwd(),
      -- Opcional: Ignora ciertos patrones (como node_modules o .git)
      hidden = true, -- Muestra archivos ocultos (opcional)
      file_ignore_patterns = { "node_modules/.*", "%.git/.*", "dist/.*", "build/.*", ".venv/.*", "%.lock"  },
    },
    live_grep = {
      cwd = vim.fn.getcwd(),                          -- Busca texto en el proyecto
      file_ignore_patterns = { "node_modules/.*", "%.git/.*", "dist/.*", "build/.*", ".venv/.*", "%.lock"  },
    },
  },
}
EOF


"BUSCAR ARCHIVOS"
"Busca nombres de archivos"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
"Busca entre buffers abiertos "
nnoremap <leader>fb <cmd>Telescope buffers<cr> 
"Buscar texto en el archivo actual"
nnoremap <leader>fs :Telescope current_buffer_fuzzy_find<CR>  
"Busca texto en todos los archivos"
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" SHORTCUTS 
" Scroll up in preview: <C-u>
" Scroll down in preview: <C-d>
" Split vertical: <C-v>
" Split horizontal: <C-x>
