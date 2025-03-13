{ pkgs, ... }@args:
{
  nixos.module.programs.icestudio = {
    name = "icestudio";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.icestudio = { inherit (pkgs) icestudio; };
      };
    examples = { };
    links = { };
  };
}
