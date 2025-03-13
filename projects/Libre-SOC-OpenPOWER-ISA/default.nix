{ pkgs, ... }:
{
  nixos.module.programs.libre-soc-openpower-isa = {
    name = "libre-soc-openpower-isa";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.libre-soc-openpower-isa = {
          inherit (pkgs) libresoc-nmigen libresoc-verilog;
        };
      };
    examples = { };
    links = { };
  };
}
