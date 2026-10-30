{
  lib,
  self,
  ...
}:
{
  flake.actions-nix = {
    workflows = {
      ".forgejo/workflows/bunny-sites.yaml" = import ./bunny-sites.nix { inherit lib self; };
    };
  };
}
