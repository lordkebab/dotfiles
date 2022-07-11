call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" Snippets
Plug 'L3MON4D3/LuaSnip'

" Go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

lua <<EOF
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)

		require("luasnip").lsp_expand(args.body)

		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
		["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
		["<cr>"] = cmp.mapping(cmp.mapping.confirm(), {"i", "c"}),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
	completion = {
	  completeopt = 'menu,menuone,noinsert,preview',
	},
})

require("lspconfig").gopls.setup({})

EOF


" set completeopt=menu,menuone,noselect

let mapleader = " "
nnoremap <leader>tt <cmd>terminal<cr>
"nnoremap <leader>bg <cmd> <cr>

" Settings for vim-go
" let g:go_auto_sameids = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_types = 1

" deoplete
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
" let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'

" telescope
source ~/.config/nvim/telescope.vim

" prevent deoplete-go from opening scratch buffer on preview
" https://github.com/deoplete-plugins/deoplete-go/issues/131
" set completeopt-=preview

set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set relativenumber
set colorcolumn=80

let g:clipboard=1

colorscheme gruvbox
let g:gruvbox_transparent_bg=1
autocmd VimEnter * hi Normal ctermbg=none

