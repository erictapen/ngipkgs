{ pkgs, ... }@args:
{
  nixos.module.programs.meta-presses = {
    name = "meta-presses";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.meta-presses = { inherit (pkgs) meta-press; };
      };
    examples = { };
    links = { };
  };
}
