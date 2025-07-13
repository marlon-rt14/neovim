" SIRVE PARA DAR EL ESTILO DE PESTANIAS TIPO FLECHA
" vim airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_powerline_fonts = 1 "activar la fuente para ver en flecha"
" let g:airline_section_z = '% l/%L:%c'
" let g:airline_section_z_padding = 2
" let g:airline_section_y = '%{strftime("%H:%M")}'
" let g:airline_theme='deus'
 
" Other configurations
" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_statusline_ontop=1
" let g:airline_section_z = ''
" let g:airline_section_y = ''
" Personalizar la sección Z de la barra de estado
" let g:airline_section_y = expand("%:e")
" behelit bubblegum kolor "
" let g:airline_theme='behelit'

" lua << EOF
"   require('lualine').setup {
"     options = {
"       icons_enabled = true,
"       theme = 'auto',
"       component_separators = { left = '', right = ''},
"       section_separators = { left = '', right = ''},
"       disabled_filetypes = {
"         statusline = {},
"         winbar = {},
"       },
"       ignore_focus = {},
"       always_divide_middle = true,
"       always_show_tabline = true,
"       globalstatus = false,
"       refresh = {
"         statusline = 100,
"         tabline = 100,
"         winbar = 100,
"       }
"     },
"     sections = {
"       lualine_a = {'mode'},
"       lualine_b = {'branch', 'diff', 'diagnostics'},
"       lualine_c = {'filename'},
"       lualine_x = {'encoding', 'fileformat', 'filetype'},
"       lualine_y = {'progress'},
"       lualine_z = {'location'}
"     },
"     inactive_sections = {
"       lualine_a = {},
"       lualine_b = {},
"       lualine_c = {'filename'},
"       lualine_x = {'location'},
"       lualine_y = {},
"       lualine_z = {}
"     },
"     tabline = {
"       lualine_a = {'buffers'},
"       lualine_z = {{'datetime', style = '%H:%M - %d/%m/%Y'}}
"     },
"     winbar = {},
"     inactive_winbar = {},
"     extensions = {}
"   }
" EOF
lua << EOF
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'nightfly',
      component_separators = '',
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      }
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {
      lualine_a = {'buffers'},
      lualine_z = {{'datetime', style = '%H:%M - %d/%m/%Y'}}
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
EOF
