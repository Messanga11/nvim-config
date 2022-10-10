local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format() end
    })
  end
end

 local nvim_lsp = require "lspconfig"

-- Tailwindcss
nvim_lsp.tailwindcss.setup {
}

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach=on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
} 

-- Dart
nvim_lsp.dartls.setup{
  on_attach=on_attach,
}

-- Python
nvim_lsp.pyright.setup{
  on_attach = on_attach
}

