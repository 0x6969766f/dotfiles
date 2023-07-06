local ok, lazy = pcall(require, "lazy")
if not ok then
  return
end

local plugins = {
  -- lazy
  { "folke/lazy.nvim" },

  -- utility lua functions
  { "nvim-lua/plenary.nvim" },

  -- git
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.config.gitsigns"
    end,
  },

  -- buffers
  { "tpope/vim-sleuth" },

  -- colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- tmux
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      require "plugins.config.tmux-navigator"
    end,
  },

  -- maximize and restore windows
  {
    "szw/vim-maximizer",
    config = function()
      require "plugins.config.vim-maximizer"
    end,
  },

  -- surround selection
  { "tpope/vim-surround" },

  -- replace with register
  { "vim-scripts/ReplaceWithRegister" },

  -- easiers comments
  {
    "numToStr/Comment.nvim",
    config = function()
      require "plugins.config.comment"
    end,
  },

  -- icons
  { "nvim-tree/nvim-web-devicons" },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "plugins.config.nvim-tree"
    end,
    version = "*",
  },

  -- tabs
  {
    "akinsho/bufferline.nvim",
    config = function()
      require "plugins.config.bufferline"
    end,
    version = "*",
  },

  { "moll/vim-bbye" },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "plugins.config.lualine"
    end,
  },

  -- telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable "make" == 1
    end,
  },

  { "nvim-telescope/telescope-ui-select.nvim" },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = function()
      require "plugins.config.telescope"
    end,
  },

  -- autocomplete
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "plugins.config.cmp"
    end,
  },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },

  -- snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },

  -- lsp: manage servers
  {
    "williamboman/mason.nvim",
    config = function()
      require "plugins.config.mason"
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },

  -- lsp: configure servers
  { "j-hui/fidget.nvim", tag = "legacy" },
  {
    "folke/neodev.nvim",
    config = function()
      require "plugins.config.neodev"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.config.lsp"
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "onsails/lspkind.nvim" },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require "plugins.config.inc-rename"
    end,
  },

  -- formatting and linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "plugins.config.null-ls"
    end,
  },
  { "jayp0521/mason-null-ls.nvim" },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSInstall",
      "TSModuleInfo",
    },
    config = function()
      require "plugins.config.treesitter"
    end,
  },

  -- treesitter: context
  { "nvim-treesitter/nvim-treesitter-context" },

  -- autoclose
  {
    "windwp/nvim-autopairs",
    config = function()
      require "plugins.config.autopairs"
    end,
  },
  { "windwp/nvim-ts-autotag" },

  -- which-key
  {
    "folke/which-key.nvim",
    config = function()
      require "plugins.config.which-key"
    end,
    keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
  },

  -- blanklines
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.config.indent-blankline"
    end,
  },

  -- harpoon
  {
    "theprimeagen/harpoon",
    config = function()
      require "plugins.config.harpoon"
    end,
  },

  -- trouble
  {
    "folke/trouble.nvim",
    config = function()
      require "plugins.config.trouble"
    end,
  },

  -- flash
  {
    "folke/flash.nvim",
    config = function()
      require "plugins.config.flash"
    end,
  },

  -- terminal
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require "plugins.config.toggleterm"
    end,
    version = "*",
  },
}

return lazy.setup(plugins, require "plugins.config.lazy-nvim")
