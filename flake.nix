{
  outputs =
    { self }:
    let
      inputs = (import ./.tack) // {
        inherit self;
      };
      extendedSelf = self // {
        inherit inputs;
      };
    in
    inputs.flake-parts.lib.mkFlake
      {
        inherit inputs;
        self = extendedSelf;
      }
      {
        systems = [
          "x86_64-linux"
        ];
        imports = [
          inputs.actions-nix.flakeModules.default
          inputs.treefmt-nix.flakeModule
          ./actions
        ];

        perSystem =
          {
            config,
            pkgs,
            system,
            inputs',
            ...
          }:
          let
            nodejs = pkgs.nodejs_26;
          in
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
            };
            treefmt.imports = [ ./flake/treefmt.nix ];

            pre-commit.settings = {
              package = pkgs.prek;
              excludes = [
                ".tack/default.nix"
                ".tack/pins.lock.json"
              ];
              hooks = {
                editorconfig-checker.enable = true;
                end-of-file-fixer.enable = true;
                keep-sorted.enable = true;
                mixed-line-endings.enable = true;
                nixfmt = {
                  enable = true;
                  settings.indent = 2;
                  settings.width = 120;
                };
                trim-trailing-whitespace.enable = true;
              };
            };

            packages = {
              default = pkgs.callPackage ./package.nix { inherit nodejs; };
              bunny = pkgs.bunny; # expose bunny here until it's (hopefully) merged
            };

            devShells.default = pkgs.mkShell {
              packages = [
                inputs'.tack.packages.tack
                config.treefmt.build.wrapper
                nodejs
                # keep-sorted start
                pkgs.bunny
                pkgs.just
                pkgs.nixfmt
                pkgs.prek
                # keep-sorted end
              ];
              shellHook = config.pre-commit.devShell.shellHook;
            };
          };
      };
}
