{ pkgs, ... }@args:
{
  nixos.module.programs.servo = {
    name = "servo";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.servo = { inherit (pkgs) servo; };
      };
    examples = { };
    links = { };
  };
}
