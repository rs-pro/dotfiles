vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#262931 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#282c34 gui=nocombine]]

vim.opt.list = false
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    show_trailing_blankline_indent = false,
}
