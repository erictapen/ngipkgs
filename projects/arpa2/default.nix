{ pkgs, ... }@args:
{
  nixos.module.programs.arpa2 = {
    name = "arpa2";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.arpa2 = {
          inherit (pkgs)
            kip
            leaf
            lillydap
            quicksasl
            steamworks
            steamworks-pulleyback
            tlspool
            tlspool-gui
            quickmem
            arpa2cm
            arpa2common
            ;
        };
      };
    examples = { };
    links = { };
  };
}
