{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      lualine-nvim
      nvim-web-devicons
      nvim-treesitter.withAllGrammars
      vim-nix
      telescope-nvim
      nvim-tree-lua
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp
      luasnip
    ];

    extraLuaConfig = ''
      -- Set theme
      vim.o.termguicolors = true
      vim.cmd("colorscheme gruvbox")

      -- Line numbers
      vim.o.number = true
      vim.o.relativenumber = true

      -- Leader key
      vim.g.mapleader = " "

      -- Telescope keybindings
      vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

      -- File explorer (nvim-tree)
      vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

      -- LSP Configuration
      local lspconfig = require('lspconfig')
      lspconfig.pyright.setup{}
      lspconfig.rust_analyzer.setup{}
      lspconfig.tsserver.setup{}
    '';
  };
}
