-- custom configs
require("configs.globals")
require("configs.options")
require("configs.alpha")
require("configs.dap")
require("configs.neotest")
require("configs.scrollbar")
require("configs.jaq")
require("configs.onedark")
require("configs.lualine")
require("configs.illuminate")
require("configs.telescope")
require("configs.notify")
require("configs.gitsigns")
require("configs.outline")
require("configs.which_key")
-- keymaps as last
require("configs.keymaps")

-- lvim.builtin.notify.active = true

lvim.builtin.breadcrumbs.active = true
--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

lvim.builtin.dap.active = true

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "tokyonight"
lvim.colorscheme = "onedark"
-- lvim.colorscheme = "monokai"
-- lvim.colorscheme = "carbonfox"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- eChange Telescope navgation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

lvim.builtin.bufferline.options.buffer_close_icon = "???"
lvim.builtin.bufferline.options.separator_style = "slant" -- | "thick" | "thin" | { 'any', 'any' }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
    { command = "isort", filetypes = { "python" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--print-with", "80" },
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "typescript", "typescriptreact" },
    },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {
        command = "flake8",
        filetypes = { "python" },
        extra_args = { "--ignore", "E501" }
    },
    {
        -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "shellcheck",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--severity", "warning" },
    },
    {
        command = "codespell",
        extra_args = { "--extra-words-list", "basf,BASF" }
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        -- filetypes = { "javascript", "python" },
    },
}

-- Additional Plugins
lvim.plugins = {
    -- color schemes
    { "EdenEast/nightfox.nvim" },
    { "navarasu/onedark.nvim" },
    -- { "tanvirtin/monokai.nvim" },

    -- sessions
    { "shatur/neovim-session-manager" },

    --pop-up
    { "stevearc/dressing.nvim" },

    -- notify
    { "rcarriga/nvim-notify" },

    -- scroll bar
    { "petertriho/nvim-scrollbar" },

    -- TODO highlights
    { "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    },

    -- Diff view
    { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },

    -- git
    { "codeindulgence/vim-tig" },

    -- lightspeed motion
    -- { "ggandor/lightspeed.nvim" },
    { "ggandor/leap.nvim" },

    -- bookmarks
    { "mattesgroeger/vim-bookmarks" },

    -- markdown
    { "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },

    -- code (k)
    -- outline
    { "simrat39/symbols-outline.nvim" },

    -- Quick run
    { "is0n/jaq-nvim" },
    { "michaelb/sniprun", run = "bash ./install.sh" },

    -- doc strings
    {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        requires = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    },

    -- DAP
    -- { "mfussenegger/nvim-dap" },
    -- { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "mfussenegger/nvim-dap-python" },

    -- neotest
    { "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        }
    },
    { "nvim-neotest/neotest-plenary" },
    { "nvim-neotest/neotest-vim-test" },
    { "nvim-neotest/neotest-python" }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
-- lvim.builtin.which_key.mappings["d"] = nil
