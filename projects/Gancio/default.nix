{
  pkgs,
  lib,
  sources,
  ...
}@args:
{
  nixos.module.programs.gancio = {
    name = "gancio";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.gancio = { inherit (pkgs) gancio; };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.gancio = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/gancio.nix";
    tests.gancio = "${sources.inputs.nixpkgs}/nixos/tests/gancio.nix";
    examples = null;
  };
}
