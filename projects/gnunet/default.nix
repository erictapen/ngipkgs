{ pkgs, sources, ... }@args:
{
  nixos.module.programs.gnunet = {
    name = "gnunet";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.gnunet = {
          inherit (pkgs)
            gnunet
            gnunet-gtk
            gnunet-messenger-cli
            libgnurl
            ;
        };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.gnunet = "${sources.inputs.nixpkgs}/nixos/modules/services/networking/gnunet.nix";
    tests = null;
    examples = null;
  };
}
