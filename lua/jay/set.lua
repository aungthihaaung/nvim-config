vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
-- vim.g.smartcase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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

-- show full path at airline
vim.g.airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
-- vim.opt.titlestring='%{expand(\"%:p:h\")}'

-- vim.g.db_adapter_sqlserver = 'sqlserver://Server=localhost;Database=cpf_fmc;User Id=sa;Password=r3d56kar;'

--[[ vim.g:dbs = {
    'dev': 'postgres://postgres:mypassword@localhost:5432/my-dev-db',
    'staging': 'postgres://postgres:mypassword@localhost:5432/my-staging-db',
    'wp': 'mysql://root@localhost/wp_awesome',
} ]]

-- db
--local api = vim.api
-- api.nvim_create_autocmd(
--  "FileType",
--  { pattern = { "sql" }, command = [[lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]] }
-- )
