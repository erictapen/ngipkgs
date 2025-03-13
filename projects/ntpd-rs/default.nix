{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.ntpd-rs = "${sources.inputs.nixpkgs}/nixos/modules/services/networking/ntp/ntpd-rs.nix";
    tests.ntpd-rs = "${sources.inputs.nixpkgs}/nixos/tests/ntpd-rs.nix";
    examples = null;
  };
}
