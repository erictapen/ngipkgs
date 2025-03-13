{ pkgs, sources, ... }:
{
  nixos = {
    modules.services.omnom = "${sources.inputs.nixpkgs}/nixos/modules/services/misc/omnom.nix";
    examples.base = {
      path = ./example.nix;
      description = "Basic Omnom configuration, mainly used for testing purposes.";
    };
    tests = null;
  };
}
