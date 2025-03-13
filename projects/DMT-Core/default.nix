{ pkgs, ... }@args:
{
  nixos.module.programs.dmt-core = {
    name = "dmt-core";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.dmt-core = {
          inherit (pkgs.python3Packages) dmt-core;
        };
      };
    examples = { };
    links = { };
  };
}
