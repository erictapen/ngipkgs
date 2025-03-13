{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.libervia = {
    name = "libervia";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.libervia = {
          inherit (pkgs)
            doubleratchet
            libervia-backend
            libervia-desktop-kivy
            libervia-media
            libervia-templates
            libxeddsa
            oldmemo
            omemo
            sat-tmp
            twomemo
            urwid-satext
            x3dh
            xeddsa
            ;
          inherit (pkgs.python3Packages) kivy-garden-modernmenu;
        };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.programs.libervia = ./module.nix;
    tests.libervia = import ./test.nix args;
    examples = {
      base = {
        description = "Enables the use of Libervia's CLI, TUI and GUI (kivy) clients.";
        path = ./examples/base.nix;
      };
    };
  };
}
