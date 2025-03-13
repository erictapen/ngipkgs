{
  pkgs,
  lib,
  sources,
}@args:
{
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
