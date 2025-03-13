{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.liberaforms-e2ee = {
    name = "liberaforms-e2ee";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.liberaforms-e2ee = { inherit (pkgs) liberaforms; };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.liberaforms = ./service.nix;
    tests.liberaforms = import ./test.nix args;
    examples = null;
  };
}
