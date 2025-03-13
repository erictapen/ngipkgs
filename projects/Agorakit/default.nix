{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.agorakit = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/agorakit.nix";
    tests.basic = import "${sources.inputs.nixpkgs}/nixos/tests/web-apps/agorakit.nix" args;
    examples = null;
  };
}
