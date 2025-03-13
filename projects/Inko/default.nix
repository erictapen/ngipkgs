{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.inko = {
    name = "inko";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.inko = { inherit (pkgs) inko ivm; };
      };
    examples = { };
    links = { };
  };
}
