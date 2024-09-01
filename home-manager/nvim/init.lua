-- INIT PLUGINS FIRST
vim.g.mapleader = " "

-- OPTIONS
vim.opt.encoding = "UTF-8"
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.list = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4

-- vim.opt.winbar = "%f %m"
vim.opt.wrap = false

require("plugins")

-- THEMES
vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme tundra")
vim.opt.background = 'dark'

local ok_m, m = pcall(require, "mapx")

if ok_m then
	m.noremap("<up>", "<nop>", "silent")
	m.noremap("<down>", "<nop>", "silent")
	m.noremap("<left>", "<nop>", "silent")
	m.noremap("<right>", "<nop>", "silent")
	
	-- lazygit
	m.map("<C-k>", ":LazyGit<CR>", "silent")
	m.map("<leader>nn", ":NvimTreeToggle<CR>", "silent")
	m.map("<M-h", ":ToggleTerm", "silent")
end
