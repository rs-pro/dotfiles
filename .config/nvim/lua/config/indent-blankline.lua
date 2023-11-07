--vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#262931 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#282c34 gui=nocombine]]


vim.opt.list = false
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"


local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = true },
}
