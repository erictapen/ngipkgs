{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.liberaforms = ./service.nix;
    tests.liberaforms = import ./test.nix args;
    examples = null;
  };
}
