{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.kbin = ./service.nix;
    examples = {
      base = {
        path = ./example.nix;
        description = "Basic configuration, mainly used for testing purposes.";
      };
    };
    tests.kbin = import ./test.nix args;
  };
}
