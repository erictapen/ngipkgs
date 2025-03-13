{ pkgs, ... }@args:
{
  nixos.module.programs.openfire-ipv6 = {
    name = "openfire-ipv6";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.openfire-ipv6 = { inherit (pkgs) openfire; };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.openfire-server = ./service.nix;
    examples = {
      base = {
        path = ./example.nix;
        description = "Basic configuration, mainly used for testing purposes.";
      };
    };
    tests.openfire-server = import ./test.nix args;
  };
}
