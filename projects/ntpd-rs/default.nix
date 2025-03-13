{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.ntpd-rs = {
    name = "ntpd-rs";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.ntpd-rs = { inherit (pkgs) ntpd-rs; };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.ntpd-rs = "${sources.inputs.nixpkgs}/nixos/modules/services/networking/ntp/ntpd-rs.nix";
    tests.ntpd-rs = "${sources.inputs.nixpkgs}/nixos/tests/ntpd-rs.nix";
    examples = null;
  };
}
