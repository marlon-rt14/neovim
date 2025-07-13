syntax on
filetype plugin indent on

set nocompatible
set number
" set numberwidth=1
set relativenumber
set mouse=a
set clipboard=unnamed
" syntax enable
set showcmd
set ruler
" set cursorline
set encoding=utf-8
set showmatch
set sw=2
"Identattion
set tabstop=4        " Un tab ocupa 4 columnas
set shiftwidth=2     " Indentación con > o < usa 
set softtabstop=2    " Presionar Tab inserta 2 espacios en modo insertar
set expandtab        " Tabs se convierten en espacios

set laststatus=2 "Muestra informacion sobre la barra de esado como el numero de linea, nombre del archivo"
set noshowmode
set autoindent
set cindent
set smartindent
set splitright
set splitbelow
"set tabline=%<%t\ %h%m%r%=%D(%l/%L,%c%V) "habilitar pestanias"
set foldmethod=indent "[syntax, indent, expr, marker, manual]"
set foldlevelstart=6
"set foldcolumn=2


set termguicolors
"set guioptions=a no soportando en nvim 11
hi Normal ctermbg=none guibg=none

call plug#begin('~/.vim/plugged')
" PERSONALIZACION
" Themes
" Plug 'tomasr/molokai'
" Plug 'dracula/vim'
Plug 'nanotech/jellybeans.vim'
Plug 'navarasu/onedark.nvim'
Plug 'ayu-theme/ayu-vim' 
Plug 'danilo-augusto/vim-afterglow'
Plug 'ray-x/aurora'
Plug 'rose-pine/neovim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'uloco/bluloco.nvim'
"para el tema bluloco"
Plug 'rktjmp/lush.nvim' 

" Statusbar tipo flecha
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'

" Syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Autocomplete"
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'saghen/blink.cmp'                    " Motor de autocompletado
Plug 'neovim/nvim-lspconfig'              " Configuración de LSPs
Plug 'williamboman/mason.nvim'            " Instalador de LSPs
Plug 'williamboman/mason-lspconfig.nvim'  " Puente entre Mason y lspconfig
Plug 'hrsh7th/nvim-cmp'               
Plug 'hrsh7th/cmp-nvim-lsp'               " Conecta LSP a blink.cmp
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}                   " Snippets
Plug 'rafamadriz/friendly-snippets'       " Snippets
Plug 'hrsh7th/cmp-buffer'                 " Palabras del buffer
Plug 'hrsh7th/cmp-path'                   " Rutas de archivo
Plug 'mfussenegger/nvim-lint'             " Linting externo (ej. htmlhint)
Plug 'xzbdmw/colorful-menu.nvim'          " Colorful menu
Plug 'ray-x/lsp_signature.nvim'


" IDE
Plug 'easymotion/vim-easymotion'

" Administrador de archivos
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'  " Dependencia
Plug 'MunifTanjim/nui.nvim'   " Dependencia

" Navegar entre archivos abiertos
Plug 'christoomey/vim-tmux-navigator'

"CSS color"
Plug 'ap/vim-css-color'

"####################################################################"

"Git"
Plug 'kdheepak/lazygit.nvim'

"Indent Guides"
""Plug 'nathanaelkane/vim-indent-guides'

"Mostrar los buffers en flecha"
Plug 'powerline/powerline'

"Icons"
"Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

"json to ts"
" Plug 'leafgarland/typescript-vim'

"perzonalizacion"
Plug 'RRethy/vim-illuminate' 
Plug 'jiangmiao/auto-pairs' "Cerrar y autocompletar parentesis, llaves y comillas



"Ver errores de python en tiempo real"

"#################################################################"

"surround"
Plug 'tpope/vim-surround'

"Codeium"
Plug 'Exafunction/codeium.vim'

"Buscar archivos"
Plug 'nvim-lua/plenary.nvim' "Dependencia requerida
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' } 

" Ident lines, mostrar una linea de guia en el scope"
Plug 'Yggdroot/indentLine' 

"Redimensionar buffers"
Plug 'simeji/winresizer'

"Mutli cursor"
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"Comentarios"
Plug 'tpope/vim-commentary'

"Auto rename tag"
Plug 'AndrewRadev/tagalong.vim'

"multiple terminal"
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

"PLUGINS PARA REACTJS"
"formatear e identar codigo"
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
"ver los error en a lado del codigo"
"js
Plug 'dense-analysis/ale' 
"python
Plug 'davidhalter/jedi-vim'
"Snippets"
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'

call plug#end()

let mapleader=" "
let g:VM_leader = '\'

" PLUGINS SETTINGS

"setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

"desactivar auto cerrar parentesis porque entre conflicto con blik.cmp
let g:AutoPairsMapCR = 0

"SnipMate deprecate"
let g:snipMate = { 'snippet_version' : 1 }

"vim-commentary"
autocmd FileType javascript setlocal commentstring={/*\ %s\ */}
autocmd FileType typescriptreact setlocal commentstring={/*\ %s\ */}
vmap . <Plug>Commentary

" easymotion
nmap <Leader>s <Plug>(easymotion-s2)

" Configuración específica de coc-tabnine
"let g:coc_tabnine_key = '<C-Space>'

"Instalar extensiones COC"
"pending coc-pylsp coc-ruff
"es necesario archivo de configuracion en el proyecto que se trabaje coc-graphql
"let g:coc_global_extensions = ['coc-tabnine', 'coc-snippets', 'coc-java', 'coc-emmet', 'coc-eslint', 'coc-yaml', 'coc-docker', 'coc-html-css-support', 'coc-htmlhint', 'coc-json', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-python', 'coc-pyright', 'coc-jedi',] 

" Redimensionar ventanas
nmap <Leader>wr :WinResizerStartResize<CR>
let g:winresizer_horiz_resize = 1
let g:winresizer_vert_resize = 3
"para que dejar el comando control + e como socroll down"
let g:winresizer_start_key = '<C-R>'
"nmap <C-w><C-r>wr :WinResizerStartResize<CR><CR>


" Atajos personalizados
source ~/.config/nvim/custom_shortcuts.vim

" Formater el codigo con prettier
source ~/.config/nvim/prettier.vim

" Configuración para abrir un terminal interno 
source ~/.config/nvim/terminal.vim

" Configuración de buscador de archivos y texto
source ~/.config/nvim/find_files_and_text.vim

" Configuración de buscador de archivos y texto
source ~/.config/nvim/file_explorer.vim

" Configuración del autocompletado 
source ~/.config/nvim/autocomplete.vim

" Identar lineas
source ~/.config/nvim/identline.vim

"HELP"
" Surround: Visual mode: S + <wrapper>
" example: S + {
" change surround 
" normal or visual mode: cs + <wrapper> + <new wrapper>
" normal or visual mode: cs '"


" FOLD 
" zM => plegar todo el 'archivo' 
" zR => desplegar todo el archivo 
" zj => moverse hacia el siguiente pliegue hacia abajo
" zk => moverse hacia el siguiente pliegue hacia arriba
" za => alternar los pliegues


lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "vim", "lua","vimdoc", "query", "markdown", 
    "markdown_inline", "python", "javascript", 
    "html", "css", "typescript", "typoscript", "tsx", 
    "graphql", "glimmer_javascript", "glimmer_typescript", "gitignore",
    "dockerfile", "regex", "yaml", "bash", "scss", "toml", "sql", "xml",
    "slint", "scheme", "ninja", "nginx", "jinja", "htmldjango", "csv",
    "cmake", "json"
  }, -- Agrega los lenguajes que desees
  highlight = {
      enable = true,              -- Activa el resaltado de sintaxis
      additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<S-CR>",
      node_decremental = "<BS>",
    },
  },
}
EOF
