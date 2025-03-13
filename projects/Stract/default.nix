{ pkgs, ... }@args:
{
  nixos.module.programs.stract = {
    name = "stract";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.stract = { inherit (pkgs) stract; };
      };
    examples = { };
    links = { };
  };
}
