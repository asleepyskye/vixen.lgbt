{
  outputs =
    { self, ... }@args:
    let
      inputs = (import ./.tack) {
        overrides = args.tackOverrides or { };
      };
      inherit (inputs) nixpkgs flake-utils;
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        treefmt = inputs.treefmt-nix.lib.evalModule pkgs ./flake/treefmt.nix;
        pre-commit = inputs.git-hooks.lib.${system}.run {
          src = ./.;
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
      in
      {
        formatter = treefmt.config.build.wrapper;
        checks.pre-commit = pre-commit;
        devShells.default = pkgs.mkShell {
          packages = [
            inputs.tack.packages.${system}.default
            treefmt.config.build.wrapper
            # keep-sorted start
            pkgs.bunny
            pkgs.just
            pkgs.nixfmt
            pkgs.nodejs_24
            pkgs.prek
            # keep-sorted end
          ]
          ++ pre-commit.enabledPackages;
          inherit (pre-commit) shellHook;
        };
      }
    );
}
