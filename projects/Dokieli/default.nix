{ pkgs, ... }@args:
{
  nixos.module.programs.dokieli = {
    name = "dokieli";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.dokieli = { inherit (pkgs) dokieli; };
      };
    examples = { };
    links = { };
  };
}
