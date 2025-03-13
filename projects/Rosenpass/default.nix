{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.rosenpass = "${sources.inputs.nixpkgs}/nixos/modules/services/networking/rosenpass.nix";
    tests.with-sops = import ./tests args;
    tests.without-sops = "${sources.inputs.nixpkgs}/nixos/tests/rosenpass.nix";
    examples = null;
  };
}
