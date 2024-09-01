function setup()
    local ok, configs = pcall(require, "nvim-treesitter.configs")

    if ok then
        configs.setup({
            enable = true,
            ensure_installed = {
                "php",
                "bash",
                "html",
                "rust",
                "dockerfile",
                "go",
                "javascript",
                "markdown",
                "rust",
                "sql",
                "svelte",
                "typescript",
                "json",
                "astro",
                "gomod",
                "gowork",
                "graphql",
                "hack",
                "prisma",
                "tsx",
                "css",
                "scss",
            },
            ignore_install = {},
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true }
        })
    end
end
