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
    use 'simrat39/rust-tools.nvim' -- rust
    -- use 'williamboman/nvim-lsp-installer' -- consider removing

    use 'tpope/vim-commentary' -- comment code

    use "rebelot/kanagawa.nvim"
    use "EdenEast/nightfox.nvim"
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    } -- telescope

    use 'preservim/nerdtree' -- nerdtree


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

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'


    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use({
      "olimorris/codecompanion.nvim",
      tag = "v17.33.0",
      strategies = {
        chat = {
          adapter = "openai",
        },
        inline = {
          adapter = "openai",
        },
        cmd = {
          adapter = "openai",
        }
      },
      requires = {
        "nvim-lua/plenary.nvim",
      }
    })

    use 'nvim-mini/mini.pairs'
    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     requires = {
    --         -- LSP Support
    --         { 'neovim/nvim-lspconfig' },
    --         { 'williamboman/mason.nvim' },
    --         { 'williamboman/mason-lspconfig.nvim' },

    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },
    --         { 'hrsh7th/cmp-buffer' },
    --         { 'hrsh7th/cmp-path' },
    --         { 'saadparwaiz1/cmp_luasnip' },
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'hrsh7th/cmp-nvim-lua' },

    --         -- Snippets
    --         { 'L3MON4D3/LuaSnip' },
    --         { 'rafamadriz/friendly-snippets' },
    --     }
    -- }
-- end)
end)
