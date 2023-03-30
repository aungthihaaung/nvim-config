-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use "nvim-lua/plenary.nvim"

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    -- use('theprimeagen/harpoon')

    use 'b3nj5m1n/kommentary'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use('mg979/vim-visual-multi')

    -- use('preservim/nerdtree')

    use('github/copilot.vim')

    use('folke/tokyonight.nvim')

    -- use('metakirby5/codi.vim')

    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons", -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup()
        end,
    })

    use("lukas-reineke/indent-blankline.nvim")

    -- dap debug
    use('mfussenegger/nvim-dap')
    use('leoluz/nvim-dap-go')
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
    --[[ use {
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
    } ]]
    use('theHamsta/nvim-dap-virtual-text')
    use('nvim-telescope/telescope-dap.nvim')
    use ('simrat39/rust-tools.nvim')
    use('rust-lang/rust.vim')


    --[[ use {
      "mfussenegger/nvim-dap",
      opt = true,
      event = "BufReadPre",
      module = { "dap" },
      wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python" },
      requires = {
        "Pocco81/DAPInstall.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
        "nvim-telescope/telescope-dap.nvim",
        { "leoluz/nvim-dap-go", module = "dap-go" },
      },
      config = function()
        require("config.dap").setup()
      end,
    } ]]

    use {'prettier/vim-prettier', run = 'yarn install' }

    use('bkad/camelcasemotion')

    -- Auto tag
    use ("windwp/nvim-ts-autotag")

    -- use ('manzeloth/live-server')

    -- use("bastibe/lunatic-python")
    --

    use { "akinsho/toggleterm.nvim" }

    use('kdheepak/lazygit.nvim')

    -- db
    --[[ use('tpope/vim-dadbod')
    use('kristijanhusak/vim-dadbod-ui')
    use('kristijanhusak/vim-dadbod-completion') ]]
    -- sqlserver://Server=localhost;Database=cpf_fmc;User Id=sa;Password=r3d56kar;

end)

