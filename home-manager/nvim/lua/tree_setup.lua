local ok, tree = pcall(require, "nvim-tree")

if ok then
    tree.setup({
        sort_by = "case_sensitive",
    })
end
