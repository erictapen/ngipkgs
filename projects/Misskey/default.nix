{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.misskey = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/misskey.nix";
    tests.misskey = "${sources.inputs.nixpkgs}/nixos/tests/misskey.nix";
    examples = null;
  };
}
