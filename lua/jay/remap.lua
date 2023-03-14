vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move line 
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", {remap=true})
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", {remap=true})
--[[ vim.keymap.set("n", "<C-j>", ":m +1<CR>==gi0w", {remap=true})
vim.keymap.set("n", "<C-k>", ":m -2<CR>==gi0w", {remap=true}) ]]
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", {remap=true})
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", {remap=true})


-- paste multiple time
vim.keymap.set("x", "p", "pgvy", {remap=true})

-- backspace
vim.keymap.set("n", "<BS>", "x")

-- error navigation
vim.keymap.set("n", "en", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "ep", function() vim.diagnostic.goto_prev() end)

-- buffer navigation
vim.keymap.set("n", "bn", ":bnext<CR>")
vim.keymap.set("n", "bp", ":bprevious<CR>")
vim.keymap.set("n", "bd", ":bdelete<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- nerd tree
-- toggle
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>")

-- center the down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center the search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- center the go to end
vim.keymap.set("n", "G", "Gzzzv")

-- prettier
vim.keymap.set("n", "<leader>p", ":Prettier<CR>")


-- cursor position after pasting
--[[ vim.keymap.set("n", "p", "gp")
vim.keymap.set("n", "P", "gP")
vim.keymap.set("n", "gp", "p")
vim.keymap.set("n", "gP", "P")
 ]]
-- select all
vim.keymap.set("n", "<C-a>", "<esc>ggVG<CR>")

-- cursor position after yanking
vim.keymap.set("x", "y", "ygv<esc>")

-- nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
-- vim.keymap.set("n", "<C-\\>", function() vim.cmd("ToggleTerm direction=float") end)

-- split pane left right navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
