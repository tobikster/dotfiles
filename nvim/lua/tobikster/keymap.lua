-- It might be helpful in the future
local nnoremap = require("tobikster.remap_helper").nnoremap

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})

nnoremap('<leader>b', ':ToggleBlameLine<CR>', { silent = true })
