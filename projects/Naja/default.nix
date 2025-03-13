{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.naja = {
    name = "naja";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.naja = { inherit (pkgs) naja; };
      };
    examples = { };
    links = { };
  };
}
