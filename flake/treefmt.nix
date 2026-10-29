{ pkgs, ... }:
let
  prettier = pkgs.writeShellScript "prettier" ''
    exec ./node_modules/.bin/prettier --write "$@"
  '';
in
{
  projectRootFile = "flake.nix";

  programs.nixfmt.enable = true;

  settings.formatter.prettier-svelte = {
    command = "${prettier}";
    includes = [
      "*.svelte"
      "*.ts"
      "*.js"
      "*.css"
      "*.html"
      "*.json"
      "*.md"
      "*.yaml"
      "*.yml"
    ];
  };

  settings.global.excludes = [
    "node_modules/*"
    ".svelte-kit/*"
    "build/*"
    "package-lock.json"
    "pnpm-lock.yaml"
    "bun.lock"
  ];
}
