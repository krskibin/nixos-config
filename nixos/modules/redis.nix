{ pkgs, ... }:

{
  config.services.redis = {
    enable = true;
    package = pkgs.redis;
    settings = {
      bind = "0.0.0.0";
      port = 6379;
      maxmemory = "256mb";
      appendonly = true;
    };
  };
}
