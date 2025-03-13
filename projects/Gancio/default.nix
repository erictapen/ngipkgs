{
  pkgs,
  lib,
  sources,
  ...
}@args:
{
  nixos = {
    modules.services.gancio = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/gancio.nix";
    tests.gancio = "${sources.inputs.nixpkgs}/nixos/tests/gancio.nix";
    examples = null;
  };
}
