function setup()
    local ok, tundra = pcall(require, "tundra")

    if ok then
        tundra.setup({
            transparent_background = false,
            plugins = {
                lsp = true,
                treesitter = true,
                telescope = true,
            },
        })
    end
end
