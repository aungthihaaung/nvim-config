-- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
-- local copilot = require('github/copilot.vim')

vim.keymap.set("i", "<C-j>", function()
    local copilot_keys = vim.fn["copilot#Accept"]()
    vim.api.nvim_feedkeys(copilot_keys, "i", true)
end)
-- [[<C-r>=copilot#Accept()<CR>]], {expr = true, remap = true, silent = true})
