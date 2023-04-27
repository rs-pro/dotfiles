require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "tsserver"},
}

local fn = vim.fn
local api = vim.api
local keymap = vim.keymap
local lsp = vim.lsp

local utils = require("utils")

local custom_attach = function(client, bufnr)
  -- Mappings.
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.silent = true
    opts.buffer = bufnr
    if r then
      keymap.set(mode, l, r, opts)
    end
  end

  map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
  map("n", "<C-]>", vim.lsp.buf.definition)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "<C-h>", vim.lsp.buf.signature_help)
  map("n", "<leader>h", vim.lsp.buf.signature_help)
  map("n", "<space>rn", vim.lsp.buf.rename, { desc = "varialbe rename" })
  map("n", "gr", vim.lsp.buf.references, { desc = "show references" })
  map("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
  map("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
  map("n", "<space>q", function()
    vim.diagnostic.setqflist { open = true }
  end, { desc = "put diagnostic to qf" })
  map("n", "<space>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
  map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
  map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type [D]efinition" })
  --[[ map("n", "<space>wl", function()
    inspect(vim.lsp.buf.list_workspace_folders())
  end, { desc = "list workspace folder" }) ]]

  -- Set some key bindings conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    map("n", "<space>f", vim.lsp.buf.formatting_sync, { desc = "format code" })
    map("x", "<space>f", vim.lsp.buf.range_formatting, { desc = "range format" })
  end

  api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local float_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always", -- show source in diagnostic popup window
        prefix = " ",
      }

      if not vim.b.diagnostics_pos then
        vim.b.diagnostics_pos = { nil, nil }
      end

      local cursor_pos = api.nvim_win_get_cursor(0)
      if
        (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
        and #vim.diagnostic.get() > 0
      then
        vim.diagnostic.open_float(nil, float_opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end,
  })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")

lspconfig.gopls.setup {
  on_attach = custom_attach,
  cmd = {"gopls", "serve"},
  -- filetypes = {"go", "gomod"},
  settings = {
  },
  capabilities = capabilities,
}

lspconfig.tsserver.setup {
  on_attach = custom_attach,
  -- filetypes = {"js", "jsx", "es6", "ts", "tsx", "javascriptreact"},
  settings = {
  },
  capabilities = capabilities,
}

-- settings for lua-language-server can be found on https://github.com/sumneko/lua-language-server/wiki/Settings .
-- lspconfig.lua_ls.setup {
  --on_attach = custom_attach,
  -- on_attach = function(client)
    -- client.server_capabilities.completionProvider = false
  -- end,
  -- settings = {
  -- },
  -- capabilities = capabilities,
-- }

-- Change diagnostic signs.
fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- global config for diagnostic
vim.diagnostic.config {
  underline = false,
  virtual_text = true,
  signs = true,
  severity_sort = true,
}

-- lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
--   underline = false,
--   virtual_text = false,
--   signs = true,
--   update_in_insert = false,
-- })

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

