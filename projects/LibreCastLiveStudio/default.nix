{ pkgs, ... }@args:
{
  nixos.module.programs.librecastlivestudio = {
    name = "librecastlivestudio";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.librecastlivestudio = {
          inherit (pkgs) librecast lcrq lcsync;
        };
      };
    examples = { };
    links = { };
  };
}
