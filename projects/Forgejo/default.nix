{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.forgejo = "${sources.inputs.nixpkgs}/nixos/modules/services/misc/forgejo.nix";
    tests = pkgs.nixosTests.forgejo;
    examples = null;
  };
}
