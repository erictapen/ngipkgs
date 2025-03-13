{ pkgs, ... }@args:
{
  nixos.module.programs.kikit = {
    name = "kikit";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.kikit = {
          inherit (pkgs) kikit;
          inherit (pkgs.kicadAddons) kikit-library;
          kicad-kikit = pkgs.kicadAddons.kikit;
        };
      };
    examples = { };
    links = { };
  };
}
