local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
    -- "lua_ls",
    -- "gopls",
    -- "pyright",
    -- "rust_analyzer",
}

-- list of servers configured with default config.
local default_servers = {
    "pylsp",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

-- lspconfig.gopls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gotmpl", "gowork" },
--     root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
--     settings = {
--         gopls = {
--             analyses = {
--                 unusedparams = true,
--             },
--             completeUnimported = true,
--             usePlaceholders = true,
--             staticcheck = true,
--         },
--     },
-- })
--
-- Pylsp setup
lspconfig.pylsp.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

-- Java Language Server
lspconfig.java_language_server.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

-- R Language Server
lspconfig.r_language_server.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

-- Ansible Language Server
lspconfig.ansiblels.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

-- Cmake Language Server
lspconfig.cmake.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

-- Bash Language Server
lspconfig.bashls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
})

--Json Language Server
-- lspconfig.jsonls({
-- on_attach = on_attach,
-- on_init = on_init,
-- capabilities = capabilities,
-- })

-- HTML-lsp setup
-- lspconfig.html.setup({
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
-- })
--
-- -- CSS-lsp setup
-- lspconfig.cssls.setup({
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
-- })
--
-- -- CSS-variables
-- lspconfig.css_variables.setup({
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
-- })

-- Rust Analyzer setup
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        Rust = {
            diagnostics = {
                enable = true,
            },
        },
    },
})

-- LuaLS Setup
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
