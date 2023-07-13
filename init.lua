require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/luasnip"})
local keymap = vim.api.nvim_set_keymap
vim.opt.ignorecase = true
vim.opt.smartcase = true


vim.g.mapleader = " "
vim.g.numberwidth=3
vim.opt.nu=true
vim.opt.relativenumber=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.smartindent=true
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.termguicolors=true
vim.opt.background="dark"
-- vim.opt.clipboard="unnamedplus"


vim.g.vimtex_compiler_method='arara'
vim.cmd("colorscheme oxocarbon")
keymap("n", "<leader>ll", ":VimtexCompile<CR>", {noremap=true})

-- lua 
require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
  update_events = 'TextChanged,TextChangedI'
})

-- Yes, we're just executing a bunch of Vimscript using vim.cmd
vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
tnoremap <Esc> <C-\><C-n>
tnoremap <C-\><C-n> <Esc>
let g:tex_flavor="latex"
syntax enable

]]
