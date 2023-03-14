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

-- Toggleterm
-- https://github.com/akinsho/toggleterm.nvim/wiki/Tips-and-Tricks#using-toggleterm-with-powershell
local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
}
for option, value in pairs(powershell_options) do
    vim.opt[option] = value
end

