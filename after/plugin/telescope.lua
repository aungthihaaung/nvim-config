require'telescope'.setup({
    defaults = {
        file_ignore_patterns = { ".git", "node_modules", "models" },
    }
})

local builtin = require('telescope.builtin')
-- project file
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<A-p>', builtin.find_files, {})
-- git file search, exclude node_modules & such
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- list buffer
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- project search
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- live search
-- unmap <C-S-F>
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<A-S-F>', builtin.live_grep, {remap=true})

-- vim.keymap.set('n', '<A-S-O>', builtin.lsp_workspace_symbols, {})
-- vim.keymap.set('n', '<A-S-O>', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<A-S-O>', builtin.lsp_dynamic_workspace_symbols, {})

vim.keymap.set('n', '<S-A-F12>', builtin.lsp_references, {})

--[[ local telescope = require("telescope")
telescope.setup({
	defaults = {
        file_ignore_patterns = { "^./.git/", "^node_modules/", "^./models/" }
	},
}) ]]


