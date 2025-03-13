{ pkgs, ... }@args:
{
  nixos.module.programs.nitrokey-3 = {
    name = "nitrokey-3";
    module =
      {
        pkgs,
        lib,
        sources,
        ...
      }@args:
      {
        options.programs.nitrokey-3 = {
          inherit (pkgs)
            nitrokey-fido2-firmware
            nitrokey-pro-firmware
            nitrokey-start-firmware
            nitrokey-storage-firmware
            nitrokey-trng-rs232-firmware
            ;
        };
      };
    examples = { };
    links = { };
  };
}
