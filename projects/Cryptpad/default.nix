{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.cryptpad = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/cryptpad.nix";
    examples = null;
  };
}
