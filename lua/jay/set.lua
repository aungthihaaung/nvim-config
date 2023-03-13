vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
-- vim.g.smartcase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.signcolumn="yes:1"

vim.opt.clipboard="unnamed"

-- copilot settings 
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- have to use windows terminal font
--[[ local font_name = "Operator Mono Lig"
local font_size = 14
vim.opt.guifont = font_name .. ":h" .. font_size
 ]]

-- vim.opt.shell="C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
vim.opt.shell="powershell"

vim.g.camelcasemotion_key = '<leader>'
