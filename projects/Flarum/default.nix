{ pkgs, sources, ... }:
{
  nixos.module.programs.flarum = {
    name = "flarum";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.flarum = { inherit (pkgs) flarum; };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.flarum = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/flarum.nix";
    tests = null;
    examples = null;
  };
}
