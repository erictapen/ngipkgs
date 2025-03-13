{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.canaille = {
    name = "canaille";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.canaille = { inherit (pkgs) canaille; };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.canaille = "${sources.inputs.nixpkgs}/nixos/modules/services/security/canaille.nix";
    tests.canaille = "${sources.inputs.nixpkgs}/nixos/tests/canaille.nix";
    examples = null;
  };
}
