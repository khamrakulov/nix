{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;   # Enable Node.js for LSP & plugins
    withPython3 = true;  # Enable Python3 support

    plugins = with pkgs.vimPlugins; [
      # UI Improvements
      gruvbox-nvim
      lualine-nvim
      nvim-web-devicons

      # Syntax Highlighting & Code Parsing
      nvim-treesitter.withAllGrammars
      vim-nix  # Nix syntax highlighting

      # File Navigation
      telescope-nvim
      nvim-tree-lua

      # LSP & Autocompletion
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp
      luasnip
    ];

    extraConfig = ''
      " Set theme
      set termguicolors
      colorscheme gruvbox

      " Enable line numbers
      set number
      set relativenumber

      " Enable syntax highlighting
      syntax enable
      filetype plugin indent on

      " Set leader key
      let mapleader = " "

      " Use telescope for searching
      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>

      " File explorer (nvim-tree)
      nnoremap <leader>e <cmd>NvimTreeToggle<cr>

      " Configure LSP
      lua << EOF
        local lspconfig = require('lspconfig')
        lspconfig.pyright.setup{}  -- Python LSP
        lspconfig.rust_analyzer.setup{}  -- Rust LSP
        lspconfig.tsserver.setup{}  -- TypeScript LSP
      EOF
    '';
  };

  environment.systemPackages = with pkgs; [
    neovim
    nodejs  # Required for some LSPs
    python3 # Needed for Python-based plugins
    ripgrep # Improves Telescope search
    fzf     # Fuzzy finder
  ];
}
