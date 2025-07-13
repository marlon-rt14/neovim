
lua << EOF
require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    window = {
        position = "current", -- "left", "right", "current", "float"
        width = 100,
        height = 30,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
    },
    filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
        filtered_items = {
        visible = true,          -- Muestra los elementos filtrados como "dimmed" en lugar de ocultarlos
        hide_dotfiles = false,   -- Muestra archivos que empiezan con punto (ej. .gitignore)
        hide_gitignored = false, -- Muestra archivos ignorados por Git
        hide_hidden = false,     -- Muestra archivos ocultos en sistemas como Windows
      },
    },
})
EOF
nnoremap <leader>e :Neotree toggle<CR>
