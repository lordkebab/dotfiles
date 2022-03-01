call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-orgmode/orgmode'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'jiangmiao/auto-pairs'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" Node.js
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }


call plug#end()

" Random settings
nnoremap <leader>tt <cmd>terminal<cr>
"nnoremap <leader>bg <cmd> <cr>

" Settings for vim-go
" let g:go_auto_sameids = 1
let g:go_highlight_build_constraints = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
" let g:go_highlight_types = 1

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'

" telescope
source ~/.config/nvim/telescope.vim

" colorscheme elflord

" prevent deoplete-go from opening scratch buffer on preview
" https://github.com/deoplete-plugins/deoplete-go/issues/131
set completeopt-=preview

set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set relativenumber

lua << EOF
require'lspconfig'.gopls.setup{}
EOF

lua <<EOF
  require'lspconfig'.terraformls.setup{} 
EOF
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

lua <<EOF
-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Documents'},
  org_default_notes_file = '~/Documents/refile.org',
})
EOF

colorscheme gruvbox

let g:gruvbox_transparent_bg=1
autocmd VimEnter * hi Normal ctermbg=none
