-- https://www.imaginaryrobots.net/posts/2021-04-17-converting-vimrc-to-lua/

require('plugins')
require('keymap')

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.virtualedit = 'onemore'
vim.opt.backspace = 'indent,eol,start'
vim.g.mapleader = "\\"
vim.cmd([[let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>'], '<Up>': ['<C-Up>'], '<Down>': ['<C-Down>']}]])


vim.g.ackprg = 'ag --vimgrep --smart-case'
vim.cmd.inoreabbrev({"ag", "Ack"})
vim.cmd.inoreabbrev({"Ag", "Ack"})

vim.g.indentLine_setColors = 0
vim.g.indentLine_color_term = 9
vim.g.indentLine_char = '┆'

-- colours and fonts
vim.opt.background = 'dark'
-- vim.cmd('colorscheme rasmus')
-- require('zephyr')

vim.opt.undodir = vim.fn.expand('~/.nvim/undo')
vim.opt.backupdir = vim.fn.expand('~/.nvim/backup')
vim.opt.directory = vim.fn.expand('~/.nvim/swap')

vim.opt.undofile = true
vim.opt.undolevels = 3000
vim.opt.undoreload = 10000
vim.opt.backup = true
vim.opt.swapfile = false

vim.opt.foldmethod = 'syntax'
vim.opt.foldlevelstart = 100

-- vim.opt.completeopt = "menu,menuone,preview,noinsert,noselect"

vim.api.nvim_cmd({
  cmd = "cabbrev",
  args = {
    "ack",
    "Ack",
    },
}, {})

vim.api.nvim_cmd({
  cmd = "cabbrev",
  args = {
    "ag",
    "Ack",
    },
}, {})

vim.cmd("au BufRead,BufNewFile *.es6 set filetype=javascript")

