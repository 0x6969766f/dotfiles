local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(c)
            -- only use null-ls for formatting instead of lsp server
            return c.name == "null-ls"
          end,
        })
      end,
      group = augroup,
    })
  end
end

null_ls.setup({
  -- format on save
  on_attach = on_attach,
  sources = {
    formatting.stylua, -- lua formatter
    formatting.prettier.with({  -- js/ts formatter
      -- only enable prettier if root has rc-file
      condition = function(utils)
        return utils.root_has_file({
          "package.json",
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.toml",
          ".prettierrc.json",
          ".prettierrc.yml",
          ".prettierrc.yaml",
          ".prettierrc.json5",
          ".prettierrc.js",
          ".prettierrc.cjs",
          ".prettierrc.lua",
          "prettier.config.js",
          "prettier.config.cjs",
          "prettier.config.lua",
        })
      end
    }),
    diagnostics.eslint_d.with({ -- js/ts linter
      -- only enable eslint if root has rc-file
      condition = function(utils)
        return utils.root_has_file({
          "package.json",
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.json",
          ".eslintrc.yaml",
          ".eslintrc.yml",
        })
      end,
    })
  }
})
