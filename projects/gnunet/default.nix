{ pkgs, sources, ... }@args:
{
  nixos = {
    modules.services.gnunet = "${sources.inputs.nixpkgs}/nixos/modules/services/networking/gnunet.nix";
    tests = null;
    examples = null;
  };
}
