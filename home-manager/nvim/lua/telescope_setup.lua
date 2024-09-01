local ok_m, m = pcall(require, "mapx")
local ok, telescope = pcall(require, "telescope")

if ok then
    telescope.setup({
        pickers = {
            find_files = {
                find_command = {
                    "fd", "--type", "f", "-H", "-E", "node_modules", "-E",
                    ".git", "-E", "vendor", "-E", ".idea", "-E", ".vscode", "-I",
                }
            }
        },
        extensions = {
            file_browser = {
                hidden = true,
                respect_gitignore = false,
                hijack_netrw = true
            },
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "ignore_case"
            }
        }
    })

    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    telescope.load_extension("project")
end

if ok_m then
    m.nnoremap("<leader>fd", ":Telescope file_browser<CR>")
    m.nnoremap("<leader>fb", ":Telescope file_browser path=%:p:h<CR>", "silent")
    m.nnoremap("<leader>ff", ":Telescope find_files<CR>", "silent")
    m.nnoremap("<leader>fs", ":Telescope live_grep<CR>", "silent")
    m.nnoremap("<leader>pp", ":Telescope project<CR>", "silent")
end
