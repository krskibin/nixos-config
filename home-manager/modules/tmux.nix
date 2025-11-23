{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;

    shortcut = "b";
    aggressiveResize = true;
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;
    keyMode = "vi";

    terminal = "screen-256color";

    shell = "${pkgs.zsh}/bin/zsh";

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.resurrect
      tmuxPlugins.catppuccin
      tmuxPlugins.cpu
    ];

    extraConfig = ''
      # Fix tmux colors
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      # Change tmux theme
      set -g @catppuccin_flavour 'mocha'
      set -g @catppuccin_window_status_style "rounded"
      
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_application}"
      set -ag status-right "#{E:@catppuccin_status_session}"
   '';
  };
}
