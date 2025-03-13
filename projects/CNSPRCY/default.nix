{ pkgs, ... }:
{
  nixos.module.programs.cnsprcy = {
    name = "cnsprcy";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.cnsprcy = { inherit (pkgs) cnsprcy; };
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
