local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    python = { "flake8", "mypy", "ruff" },
    c = { "cspell" },
    cpp = { "cpplint" },
    -- rust = { "rust-analyzer" },
    html = { "htmlhint" },
}

lint.linters.luacheck.args = {
    "--globals",
    "love",
    "vim",
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})
