{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.canaille = "${sources.inputs.nixpkgs}/nixos/modules/services/security/canaille.nix";
    tests.canaille = "${sources.inputs.nixpkgs}/nixos/tests/canaille.nix";
    examples = null;
  };
}
