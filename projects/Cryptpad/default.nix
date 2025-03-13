{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.cryptpad = {
    name = "cryptpad";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.cryptpad = { inherit (pkgs) cryptpad; };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.cryptpad = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/cryptpad.nix";
    examples = null;
  };
}
