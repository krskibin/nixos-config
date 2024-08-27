{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    # Enable neovim aliasses
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Plugins
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      comment-nvim
      
      neodev-nvim
      nvim-cmp
      vim-nix
    ];

  };
}
