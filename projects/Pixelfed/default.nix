{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.pixelfed = {
    name = "pixelfed";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.pixelfed = { inherit (pkgs) pixelfed; };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.pixelfed = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/pixelfed.nix";
    tests.pixelfed = "${sources.inputs.nixpkgs}/nixos/tests/web-apps/pixelfed/standard.nix";
    examples = null;
  };
}
