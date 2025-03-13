{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.gnutaler = {
    name = "gnutaler";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.gnutaler = {
          inherit (pkgs)
            anastasis
            anastasis-gtk
            libeufin
            taldir
            taler-depolymerization
            taler-exchange
            taler-mdb
            taler-merchant
            taler-sync
            taler-wallet-core
            twister
            ;
        };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services = null;
    tests = null;
    examples = null;
  };
}
