{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services.peertube = ./module.nix;
    tests.peertube-plugins = import ./test.nix args;
    examples = {
      base = {
        description = "Basic configuration, mainly used for testing purposes.";
        path = ./example.nix;
      };
    };
  };
}
