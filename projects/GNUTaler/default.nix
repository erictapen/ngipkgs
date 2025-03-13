{
  pkgs,
  lib,
  sources,
}@args:
{
  nixos = {
    modules.services = null;
    tests = null;
    examples = null;
  };
}
