{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.scion-1m = {
    name = "scion-1m";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.scion-1m = {
          inherit (pkgs)
            scion
            scion-apps
            scion-bootstrapper
            ioq3-scion
            pan-bindings
            ;
        };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.scion = "${sources.inputs.nixpkgs}/nixos/modules/services/networking/scion/scion.nix";
    tests = null;
    examples = null;
  };
}
