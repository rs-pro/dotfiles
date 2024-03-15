local queries = require "nvim-treesitter.query"

require("nvim-treesitter.configs").setup {
  ensure_installed = { "python", "cpp", "lua", "vim", "javascript", "ruby", "go", "css", "html", "java", "php", "rust", "typescript", "comment"},
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = function(lang, buf)
        if lang == 'markdown' then
          return true
        end
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    is_supported = queries.has_highlights,
    --additional_vim_regex_highlighting = false,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = false
  },
}

require'nvim-treesitter.configs'.setup {
}
