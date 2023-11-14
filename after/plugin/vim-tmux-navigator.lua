print('vim tmux navigator')

vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_no_wrap = 1

local cmp_lang_maps = {
    [QWERTY] = function ()
        local opts = { noremap = true, silent = true }
        vim.keymap.set('', '<C-h>', ':TmuxNavigateLeft<cr>', opts)
        vim.keymap.set('', '<C-j>', ':TmuxNavigateDown<cr>', opts)
        vim.keymap.set('', '<C-k>', ':TmuxNavigateUp<cr>', opts)
        vim.keymap.set('', '<C-l>', ':TmuxNavigateRight<cr>', opts)
    end,
    [COLMAKDH] = function ()
        local opts = { noremap = true, silent = true }
        vim.keymap.set('', '<C-j>', ':TmuxNavigateLeft<cr>', opts)
        vim.keymap.set('', '<C-l>', ':TmuxNavigateDown<cr>', opts)
        vim.keymap.set('', '<C-u>', ':TmuxNavigateUp<cr>', opts)
        vim.keymap.set('', '<C-y>', ':TmuxNavigateRight<cr>', opts)
    end
}

cmp_lang_maps[LANGMAP_SETTING]()
