local keymap = vim.keymap

-- avoid opening help, treat it like escape (all modes)
keymap.set('n', '<F1>', '<Esc>')

-- Indent with tab
keymap.set("n", "<Tab>", ">>")
keymap.set("n", "<S-Tab>", "<<")
keymap.set("v", "<Tab>", ":><CR>gv")
keymap.set("v", "<S-Tab>", ":<<CR>gv")
keymap.set("i", "<Tab>", "<c-t>")
keymap.set("i", "<S-Tab>", "<c-d>")

-- split close\open keys
keymap.set("n", "<m-x>", "<C-w>q")
keymap.set("n", "<m-c>", "<C-w>q")
keymap.set("n", "<m-'>", "<C-w>v")
keymap.set("n", "<m-/>", "<C-w>s")

-- split navigation with alt-arrows
keymap.set("n", "<M-left>", "<c-w>h")
keymap.set("n", "<M-Right>", "<C-W>l")
keymap.set("n", "<M-Up>", "<C-W>k")
keymap.set("n", "<M-Down>", "<C-W>j")

-- swap buffers
keymap.set("n", "<C-e>", ":e#<CR>")

-- Better page up-down
keymap.set("n", "<PageUp>", "<C-U>")
keymap.set("n", "<PageDown>", "<C-D>")
keymap.set("i", "<PageUp>", "<C-O><C-U>")
keymap.set("i", "<PageDown>", "<C-O><C-D>")

-- Better home key
keymap.set("n", "<Home>", "^")
keymap.set("i", "<Home>", "<C-O><Home>")
keymap.set("n", "<kHome>", "^")
keymap.set("i", "<kHome>", "<C-O><Home>")

-- Move line with ctrl-up/down
keymap.set("n", "<C-Up>", "[e")
keymap.set("n", "<C-Down>", "]e")
keymap.set("v", "<C-Up>", "[egv")
keymap.set("v", "<C-Down>", "]egv")

-- M-s to insert without saving to buffer
keymap.set("n", "<M-s>", "\"_diwP")
keymap.set("v", "<M-s>", "\"_dP")
-- keymap.set("n", "<M-a>", "vw\"_dP")


-- delete word without putting it to buffer
keymap.set("", "<F2>", "\"_dw")
-- delete line without putting it to buffer
keymap.set("", "<F3>", "\"_dd")
-- delete without putting to buffer
keymap.set("", "<F4>", "\"_d")

-- comment
keymap.set('n', '<F5>', '<Plug>(comment_toggle_linewise_current)')
keymap.set('n', '<F6>', '<Plug>(comment_toggle_linewise_current)')

keymap.set('v', '<F5>', '<Plug>(comment_toggle_linewise_visual)')
keymap.set('v', '<F6>', '<Plug>(comment_toggle_blockwise_visual)')

-- Cleanup windows EOL
keymap.set("", "<F7>", ":%s/\\r//g<cr>")

-- Reindent file
keymap.set("", "<F9>", "gg=G")

-- Plugin toggles
keymap.set("", "<leader>u", ":MundoToggle<CR>")
keymap.set("", "<leader>t", ":NvimTreeToggle<CR>")

-- Easier in visual mode
keymap.set("", "<S-Up>", "<Up>")
keymap.set("", "<S-Down>", "<Down>")

-- Search files in popup window
keymap.set("", "<C-k>", ":<C-U>Leaderf file --popup<CR>")

-- Grep project files in popup window
keymap.set("", "<C-p>", ":<C-U>Leaderf rg --no-messages --popup<CR>")

-- save
keymap.set("", "<C-s>", ":wall<cr>")
keymap.set("i", "<C-s>", "<esc>:wall<cr>")

-- hop
keymap.set("", "<C-h>", ":HopWord<CR>")

keymap.set("", "<leader>v", ":e ~/.config/nvim/init.lua")
keymap.set("", "<leader>k", ":e ~/.config/nvim/lua/keymap.lua")
keymap.set("", "<leader>p", ":e ~/.config/nvim/lua/plugins.lua")
