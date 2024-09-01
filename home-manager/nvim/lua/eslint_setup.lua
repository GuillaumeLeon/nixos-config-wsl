function setup()
    local ok, eslint = pcall(require, "eslint")

    if ok then
        eslint.setup({
            bin = 'eslint',
            code_actions = {
                enable = true,
                apply_on_save = {
                    enable = true,
                    types = { "problem" },
                },
            },
            diagnostics = {
                enable = true,
                report_unused_disable_directives = false,
                run_on = "type",
            }
        })
    end
end
