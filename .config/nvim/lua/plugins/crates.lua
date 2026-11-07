require("crates").setup {
    completion = {
        coq = {
            enabled = true,
            name = "crates.nvim",
        },
    },
    lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
    },
}
