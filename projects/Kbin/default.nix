{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.kbin = {
    name = "kbin";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.kbin = {
          inherit (pkgs) kbin kbin-frontend kbin-backend;
        };
      };
    examples = { };
    links = { };
  };
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
