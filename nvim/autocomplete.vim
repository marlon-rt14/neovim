
" Configuración de Mason
lua << EOF
require('mason').setup(
  {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  }
)
require('mason-lspconfig').setup {
  ensure_installed = {
    -- LSP basico
    'ts_ls', 'html', 'cssls', 'pyright', 'jdtls',
    'emmet_ls', 'eslint', 'yamlls', 'dockerls', 'clangd', 'jsonls',
    -- LSPs adicionales (basados en tus extensiones coc)
    'tailwindcss', 'sqlls', 'bashls', 'lua_ls', 'marksman', 'graphql',
    'harper_ls', 'taplo', 'vimls', 'lemminx', 'superhtml', 'lwc_ls',
    -- Mas
    'ast_grep', 'css_variables', 'cssmodules_ls', 'unocss',
    'docker_compose_language_service', 'jinja_lsp',
  },
}
EOF

" Configuración de blink.cmp
lua << EOF
-- Configuración de LuaSnip
require("luasnip.loaders.from_vscode").lazy_load()

-- Configuración de lsp_signature
require("lsp_signature").setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  },
  hint_enable = true,
  hint_prefix = "🔍 ",
})

-- Configuración de blink.cmp (tu motor principal de autocompletado)
require('blink.cmp').setup {
  fuzzy = {
    prebuilt_binaries = {
      force_version = "v1.1.1"
    }
  },
  completion = {
    trigger = {
      show_on_keyword = true 
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = false
      }
    },
    -- Disable auto brackets
    -- NOTE: some LSPs may add auto brackets themselves anyway
    accept = { auto_brackets = { enabled = false}, },
    menu = {
      draw = {
        treesitter = { 'lsp' },
        columns = {
          { "kind_icon", "label", "label_description", gap = 1 }, {"source_name", gap = 1}
        },
        components = {
          label = {
            text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
        },
     },
    },
    documentation = {
      auto_show = true
    },
  },
  sources = {
    default = { 'lsp', 'buffer', 'snippets', 'path' },
  },
  -- Configuración de mapeo de teclas personalizado
  keymap = {
    preset = 'default',
    ['CR'] = { 'select_accept_and_enter' },
    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<Tab>'] = { 'select_next', 'fallback' },
  },
  --  fuzzy = { implementation = "prefer_rust_with_warning" },
}

-- Configuración de nvim-cmp y capacidades LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- Función para configurar LSPs con capacidades comunes
local setup_lsp = function(server_name)
  lspconfig[server_name].setup { capabilities = capabilities }
end

-- Configuración de todos los LSPs básicos
setup_lsp('ts_ls')
setup_lsp('html')
setup_lsp('cssls')
setup_lsp('pyright')
setup_lsp('jdtls')
setup_lsp('emmet_ls')
setup_lsp('eslint')
setup_lsp('yamlls')
setup_lsp('dockerls')
setup_lsp('jsonls')
setup_lsp('clangd')

-- LSPs adicionales
setup_lsp('tailwindcss')
setup_lsp('sqlls')
setup_lsp('bashls')
setup_lsp('lua_ls')
setup_lsp('marksman')
setup_lsp('graphql')
setup_lsp('harper_ls')
setup_lsp('taplo')
setup_lsp('vimls')
setup_lsp('lemminx')
setup_lsp('lwc_ls')

-- Más LSPs
setup_lsp('ast_grep')
setup_lsp('css_variables')
setup_lsp('cssmodules_ls')
setup_lsp('unocss')
setup_lsp('docker_compose_language_service')
setup_lsp('jinja_lsp')
EOF

" Configuración de nvim-lint (opcional)
lua << EOF
require('lint').linters_by_ft = {
  html = {'htmlhint'},
  javascript = {'eslint'},
  typescript = {'eslint'},
  python = {'flake8', 'pylint'},
  -- css = {'stylelint'},
  css = {},
  scss = {'stylelint'},
  yaml = {'yamllint'},
  json = {'jsonlint'},
  java = {'checkstyle'},
  markdown = {'markdownlint'},
  bash = {'shellcheck'},
  dockerfile = {'hadolint'},
  lua = {'luacheck'},
  sh = {'shellcheck'},
  zsh = {'shellcheck'}
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  callback = function()
    require("lint").try_lint()
  end,
})
EOF

" Mapeos para LSP
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>rn :lua vim.lsp.buf.rename()<CR>
