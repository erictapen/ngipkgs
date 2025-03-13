{ pkgs, ... }:
{
  nixos = {
    modules.services = null;
    tests = null;
    examples = null;
  };
}
