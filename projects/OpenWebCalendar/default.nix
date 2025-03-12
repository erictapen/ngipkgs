{
  pkgs,
  lib,
  sources,
  ...
}@args:
{
  metadata.subgrants = [ "OpenWebCalendar" ];
  nixos.modules.services.open-web-calendar = {
    name = "open-web-calendar";
    module = "${sources.inputs.nixpkgs}/nixos/modules/services/web-apps/open-web-calendar.nix";
    examples = { };
    links = { };
  };
}
