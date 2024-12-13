local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
    cmd = { "clangd" },
    filetypes = {"c", "cpp", "objc", "objcpp"},
    single_file_support = true,
    capabilities = capabilities,
})

lspconfig.pyright.setup{}

lspconfig.lua_ls.setup({})

lspconfig.emmet_ls.setup{
    capabilities = capabilities,
}

lspconfig.ts_ls.setup{
    capabilities = capabilities,
}
