local ok_lsp, lsp = pcall(require, "lspconfig")
if not ok_lsp then
  return
end

local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
if not ok_cmp then
  return
end

local ok_typescript, typescript = pcall(require, "typescript")
if not ok_typescript then
  return
end

local k = vim.keymap

-- enable keybindings for available lsp servers
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  k.set("n", "gR", "<CMD>Telescope lsp_references<CR>", opts) -- show definition, references
  k.set("n", "gD", vim.lsp.buf.desclaration, opts) -- go to declaration
  k.set("n", "gd", "<CMD>Telescope lsp_definitions<CR>", opts) -- see definition and make edits in window
  k.set("n", "gi", "<CMD>Telescope lsp_implementations<CR>", opts) -- go to implementation
  k.set("n", "gt", "<CMD>Telescope lsp_type_definitions<CR>", opts) -- go to implementation
  k.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
  k.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
  k.set("n", "<leader>rn", ":IncRename ", opts) -- smart rename
  k.set("n", "<leader>D", "<CMD>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
  k.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
  k.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
  k.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
  k.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  if client.name == "tsserver" then
    k.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    k.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
    k.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
  end
end

-- enable autocomplete
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- change the diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "✶ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

--- configure servers
lsp["ansiblels"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["astro"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["bashls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["cssmodules_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["docker_compose_language_service"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["dockerls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["dotls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["emmet_ls"].setup({
  capabilities = capabilities,
  filetypes = {
    "html",
    "typescriptreact",
    "javascriptreact",
    "css",
    "sass",
    "scss",
    "less",
    "svelte",
  },
  on_attach = on_attach,
})

lsp["gopls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

lsp["sqlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["svelte"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


lsp["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["taplo"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp["terraformls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
})

lsp["yamlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


