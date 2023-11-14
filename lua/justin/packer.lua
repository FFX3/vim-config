-- on fresh install run 
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({ 'rose-pine/neovim', as = 'rose-pine' })

    vim.cmd('colorscheme rose-pine')

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major
        --(first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

    use('jwalton512/vim-blade')

    use('junegunn/goyo.vim')
    use('junegunn/limelight.vim')
    use{
        'vimwiki/vimwiki',
        config = function()
            vim.cmd([[
            let g:vimwiki_list = [{'path': '~/Notes/second-brain',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
            ]])
        end
    }

    use "nvim-lua/plenary.nvim"

    use {
        "epwalsh/obsidian.nvim",
        requires = {
            "nvim-lua/plenary.nvim", -- Required
            'hrsh7th/nvim-cmp',
            'nvim-telescope/telescope.nvim'
        },
    }

    use 'christoomey/vim-tmux-navigator'
end)
