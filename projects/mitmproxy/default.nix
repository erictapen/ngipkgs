{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos.module.programs.mitmproxy = {
    name = "mitmproxy";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.mitmproxy = { inherit (pkgs) mitmproxy; };
      };
    examples = { };
    links = { };
  };
}
