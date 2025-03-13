{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.forgejo = {
    name = "forgejo";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.forgejo = {
          inherit (pkgs) forgejo forgejo-cli forgejo-runner;
        };
      };
    examples = { };
    links = { };
  };
  nixos = {
    modules.services.forgejo = "${sources.inputs.nixpkgs}/nixos/modules/services/misc/forgejo.nix";
    tests = pkgs.nixosTests.forgejo;
    examples = null;
  };
}
