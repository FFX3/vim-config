local lsp = require("lsp-zero")

lsp.preset('recommended')

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.ensure_installed({
  'tsserver',
  'denols',
  'rust_analyzer',
  'lua_ls',
  'svelte'
})

local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-l>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local on_attach = function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    local active_clients = vim.lsp.get_active_clients()
    if client.name == 'denols' then
        vim.keymap.set("n", "<leader>c", function()
            vim.api.nvim_command('!deno cache %')
        end, opts)


        for _, client_ in pairs(active_clients) do
            -- stop tsserver if denols is already active
            if client_.name == 'tsserver' then
                --client_.stop()
            end
        end
    elseif client.name == 'tsserver' then
        for _, client_ in pairs(active_clients) do
            -- prevent tsserver from starting if denols is already active
            if client_.name == 'denols' then
                --client.stop()
            end
        end
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lsp.skip_server_setup({'denols', 'tsserver', 'svelte'})

local nvim_lsp = require('lspconfig')
nvim_lsp.denols.setup({
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", "import_map.json"),
})

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
})

nvim_lsp.svelte.setup ({
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
})

lsp.on_attach(on_attach)

lsp.setup()
