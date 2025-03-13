{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.misskey = {
    name = "misskey";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.misskey = { inherit (pkgs) misskey; };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.misskey = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/misskey.nix";
    tests.misskey = "${sources.inputs.nixpkgs}/nixos/tests/misskey.nix";
    examples = null;
  };
}
