local ok_mason, mason = pcall(require, "mason")
if not ok_mason then
  return
end

local ok_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
if not ok_mason_lsp then
  return
end

local ok_mason_null_ls, mason_null_ls = pcall(require, "mason-null-ls")
if not ok_mason_null_ls then
  return
end

mason.setup()

mason_lsp.setup({
  ensure_installed = {
    "ansiblels",
    "astro",
    "bashls",
    "cssls",
    "cssmodules_ls",
    "docker_compose_language_service",
    "dockerls",
    "dotls",
    "emmet_ls",
    "eslint",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "sqlls",
    "svelte",
    "tailwindcss",
    "taplo",
    "terraformls",
    "tsserver",
    "yamlls",
  },
  automatic_installation = true,
})

mason_null_ls.setup({
  ensure_installed = {
    "eslint_d",
    "prettier",
    "stylua",
  }
})
