-- https://www.imaginaryrobots.net/posts/2021-04-17-converting-vimrc-to-lua/

-- Configure Python path for pyenv
-- vim.g.python3_host_prog = '/home/gleb/.pyenv/shims/python3'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins")

require('keymap')

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.opt.shiftwidth = 2

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 7

vim.opt.termguicolors = true

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.opt.pumheight = 10

vim.opt.showmode = false

vim.opt.timeoutlen = 300
vim.opt.updatetime = 200

vim.opt.autowrite = false

vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.fillchars = { eob = ' ' }

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true

vim.opt.showbreak = '↪'

vim.opt.wildmode = { 'longest:full', 'full' }

vim.opt.winminwidth = 5

vim.opt.grepprg = 'rg --vimgrep --follow'

vim.opt.title = true

vim.opt.confirm = true

vim.opt.exrc = true

-- spell
vim.opt.spelllang = { 'en', 'ru' }
vim.opt.spelloptions = 'camel'

vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

vim.opt.shellcmdflag = '-s'

vim.diagnostic.config({
  virtual_text = {
    source = 'if_many',
    prefix = ' ■',
  },
})

-- Autocommands
local api = vim.api

-- Highlight on yank
api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)
