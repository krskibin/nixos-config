{ pkgs, ... }:

{
  services.redis.servers."".enable = true;
  services.redis.servers."".port = 6379;
}
