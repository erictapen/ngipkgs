{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.mcaptcha = {
    name = "mcaptcha";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.mcaptcha = {
          inherit (pkgs) mcaptcha mcaptcha-cache;
        };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.mcaptcha = ./service.nix;
    tests = {
      create-locally = import ./tests/create-locally.nix args;
      bring-your-own-services = import ./tests/bring-your-own-services.nix args;
    };
    examples = null;
  };
}
