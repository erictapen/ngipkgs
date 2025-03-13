{ pkgs, ... }@args:
{
  nixos.module.programs.hypermachines = {
    name = "hypermachines";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.hypermachines = {
          inherit (pkgs)
            autobase
            corestore
            hyperbeam
            hyperblobs
            hypercore
            hyperswarm
            ;
        };
      };
    examples = { };
    links = { };
  };
}
