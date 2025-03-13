{ pkgs, ... }@args:
{
  nixos.module.programs.lib25519 = {
    name = "lib25519";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.lib25519 = {
          inherit (pkgs) lib25519 libcpucycles librandombytes;
        };
      };
    examples = { };
    links = { };
  };
}
