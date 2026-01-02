local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
    cmd = { "clangd" },
    filetypes = {"c", "cpp", "hpp", "h", "objc", "objcpp"},
    single_file_support = true,
    capabilities = capabilities,
})

vim.lsp.enable('pyright')

vim.lsp.enable('lua_ls')

vim.lsp.enable('bashls')

vim.lsp.enable('cmake')

vim.lsp.enable('emmet_language_server')
