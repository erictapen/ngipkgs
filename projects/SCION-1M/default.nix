{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.scion = "${sources.inputs.nixpkgs}/nixos/modules/services/networking/scion/scion.nix";
    tests = null;
    examples = null;
  };
}
