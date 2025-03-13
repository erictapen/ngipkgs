{ pkgs, ... }:
{
  nixos.module.programs.tslib = {
    name = "tslib";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.tslib = { inherit (pkgs) tslib; };
      };
    examples = { };
    links = { };
  };
}
