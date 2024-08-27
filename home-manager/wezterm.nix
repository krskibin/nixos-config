{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require('wezterm')
      local config = wezterm.config_builder()
      
      config.default_gui_startup_args = {'start'm '--always-new-process'}

      return config
    '';
  };
}
