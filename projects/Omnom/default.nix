{ pkgs, sources, ... }:
{
  nixos.module.programs.omnom = {
    name = "omnom";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.omnom = { inherit (pkgs) omnom; };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.omnom = "${sources.inputs.nixpkgs}/nixos/modules/services/misc/omnom.nix";
    examples.base = {
      path = ./example.nix;
      description = "Basic Omnom configuration, mainly used for testing purposes.";
    };
    tests = null;
  };
}
