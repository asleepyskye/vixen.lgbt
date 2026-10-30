{
  lib,
  self,
  ...
}:
{
  flake.actions-nix = {
    pre-commit.enable = true;
    workflows = {
      ".forgejo/workflows/bunny-sites.yaml" = import ./bunny-sites.nix { inherit lib self; };
    };
  };
}
