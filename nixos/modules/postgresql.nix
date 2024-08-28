{ pkgs, ...}:

{
  config.services.postgresql = {
    enable = true;
    ensureDatabases = [ "mydatabase" ];
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local   all      all                     trust
      host    all      all     127.0.0.1/32    trust
      host    all      all     ::1/128         trust
    '';

    identMap = ''
       superuser_map      root      postgres
       superuser_map      postgres  postgres
       superuser_map      /^(.*)$   \1
    '';

    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE krystian WITH CREATEDB CREATEROLE LOGIN SUPERUSER;
    '';
  };
}
