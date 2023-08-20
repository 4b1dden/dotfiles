return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- meta

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'ms-jpq/coq_nvim'
    use 'simrat39/rust-tools.nvim' -- rust
    -- use 'williamboman/nvim-lsp-installer' -- consider removing

    use 'tpope/vim-commentary' -- comment code

    use "rebelot/kanagawa.nvim"
    use "EdenEast/nightfox.nvim"
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    } -- telescope

    use 'preservim/nerdtree' -- nerdtree

    use 'jiangmiao/auto-pairs' -- auto pairs

    use 'Vonr/align.nvim' -- easy align

    use 'vim-airline/vim-airline' -- airline

    use 'Shatur/neovim-ayu' -- ayu theme

    use "catppuccin/nvim" -- catppuccin

    use 'ray-x/go.nvim'
    -- use 'mg979/vim-visual-multi'

    use 'ThePrimeagen/harpoon'
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })


    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
end)
