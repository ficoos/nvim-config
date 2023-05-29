return {
    {
        'folke/tokyonight.nvim',
        opts = {
            style = "night",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day",     -- The theme is used when the background is set to light
            transparent = false,     -- Enable this to disable setting the background color
            terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = {},
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark",                   -- style for sidebars, see below
                floats = "dark",                     -- style for floating windows
            },
            sidebars = { "qf", "help", "terminal" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3,                    -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false,        -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false,                    -- dims inactive windows
            lualine_bold = false,                    -- When `true`, section headers in the lualine theme will be bold
            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            ---@param colors ColorScheme
            -- on_colors = function(colors) end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param highlights Highlights
            ---@param colors ColorScheme
            -- on_highlights = function(highlights, colors) end,
        }
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-tree/nvim-web-devicons' },
        },
        config = function()
            local actions = require "telescope.actions"
            require("telescope").setup {
                pickers = {
                    find_files = {
                        previewer = false,
                    },
                    git_files = {
                        previewer = false,
                    },
                    buffers = {
                        previewer = false,
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                            }
                        }
                    }
                }
            }
        end
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    },

    {
        "folke/neodev.nvim",
        opts = { library = { plugins = { "nvim-dap-ui" }, types = true }, }
    },

    'simrat39/rust-tools.nvim',

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            --vim.opt.list = true
            --vim.opt.listchars:append "space:⋅"
            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = false,
                show_end_of_line = false,
                use_treesitter = true
            }
        end
    },
    { "stevearc/dressing.nvim" },
}
