local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
    history = true,
    update_events = "TextChanged,TextChangedI",
    --update_events = "TextChanged,TextChangedI,TextChangedP,TextChangedT",
    --update_events = "InsertChange",

    enable_autosnippets = true,

    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<--", "Error" } },
            },
        },
    }
}

-- sets

vim.keymap.set({ "i", "s" }, "<A-j>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = false })

vim.keymap.set({ "i", "s" }, "<A-i>", function()
    if ls.expand_or_jumpable() then
        ls.jump(-1)
    end
end, { silent = false })

vim.keymap.set({ "i" }, "<A-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

ls.add_snippets("all", {
    ls.snippet("expand", ls.text_node("-- this is what was expanded!")),
})

print('realoading snippets')

package.loaded['snippets'] = nil
require('snippets')

