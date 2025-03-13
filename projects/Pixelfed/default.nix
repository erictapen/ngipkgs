{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.pixelfed = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/pixelfed.nix";
    tests.pixelfed = "${sources.inputs.nixpkgs}/nixos/tests/web-apps/pixelfed/standard.nix";
    examples = null;
  };
}
