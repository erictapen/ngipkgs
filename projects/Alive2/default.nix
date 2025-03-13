{ pkgs, ... }@args:
{
  nixos.module.programs.alive2 = {
    name = "alive2";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.alive2 = { inherit (pkgs) alive2; };
      };
    examples = { };
    links = { };
  };
}
