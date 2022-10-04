-- https://www.imaginaryrobots.net/posts/2021-04-17-converting-vimrc-to-lua/

require('plugins')
require('keymap')

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.opt.autoread = true
vim.opt.virtualedit = 'onemore'
vim.opt.backspace = 'indent,eol,start'
vim.g.mapleader = "\\"

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

function _G.current_tab()
  local curr_buf = vim.fn.bufnr()
  local total = 0
  local curr_tab

  for i = 1, vim.fn.tabpagenr('$') do
    total = total + 1
    for _, bufnr in ipairs(vim.fn.tabpagebuflist(i)) do
      if bufnr == curr_buf then
        curr_tab = i
      end
    end
  end

  return string.format('(%d of %d)', curr_tab, total)
end

vim.opt.titlestring = [[%f %h%m%r%w - %{v:progname} %{luaeval('current_tab()')}]]
