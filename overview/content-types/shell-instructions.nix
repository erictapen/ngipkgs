{
  name,
  config,
  lib,
  ...
}:
let
  inherit (builtins) length;
  inherit (lib) mkOption types;
in
{
  options = {
    instructions = mkOption {
      type =
        with types;
        either
          # cross-platform
          (submodule ./shell-session.nix)
          # platform-specific
          (
            listOf (submodule {
              options = {
                platform = mkOption {
                  type = str;
                };
                id = mkOption {
                  type = str;
                  description = ''
                    A unique value that can be used to identify HTML elements.
                  '';
                };
                shell-session = mkOption {
                  type = submodule ./shell-session.nix;
                };
              };
            })
          );
    };
    __toString = mkOption {
      type = with types; functionTo str;
      readOnly = true;
      default =
        self:
        if lib.isList self.instructions then
          ''
            <div>
              <style>
                ${lib.concatMapStringsSep "\n" (i: ''
                  #tab-${i.id}:checked ~ #instructions-${i.id} {
                    display: block;
                  }
                '') self.instructions}
              </style>
              ${lib.concatStringsSep "\n" (
                lib.zipListsWith (index: instruction: ''
                  <input type="radio" id="tab-${instruction.id}" class="distro-picker" name="platform" ${
                    lib.optionalString (index == 1) "checked"
                  }>
                  <label for="tab-${instruction.id}">${instruction.platform}</label>
                '') (lib.range 1 (length self.instructions)) self.instructions
              )}
              ${lib.concatMapStringsSep "\n" (i: ''
                <div id="instructions-${i.id}" class="distro-instructions">
                  ${toString i.shell-session}
                </div>
              '') self.instructions}
            </div>
          ''
        else
          toString self.instructions;
    };
  };
}
