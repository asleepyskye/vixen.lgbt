{ ... }: {
  name = "deploy site";
  on = {
    workflow_dispatch = { };
    push = {
      branches = [
        "main"
      ];
      paths = [
        ".forgejo/workflows/**"
        "src/**"
        "static/**"
        "package-lock.json"
      ];
    };
  };
  env = {
    NIX_CONFIG = ''
      build-users-group =
      extra-experimental-features = nix-command flakes
      extra-substituters = https://cache-aux.foxpost.ing https://ci.vulpe.systems/nix-cache https://nix-community.cachix.org
      extra-trusted-public-keys = vulpe-cache-aux:7uN1rt1iBh4/U93aYJgWSHLwH6z7QXQIH59X3hX/svA= ci.vulpe.systems-1:wl5kb1c8tSW8sMxgIKhYj2Wlyt/VeXCw79VgXQByYVg= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=
    '';
  };
  concurrency = {
    group = "bunny-sites";
    cancel-in-progress = false;
  };
  jobs.deploy = {
    runs-on = "nixos";
    steps = [
      {
        name = "checkout";
        uses = "https://code.forgejo.org/actions/checkout@v7";
        "with" = {
          fetch-depth = 0;
        };
      }
      {
        name = "build";
        run = "nix build .#default";
      }
      {
        name = "deploy";
        env = {
          BUNNYNET_API_KEY = "\${{ secrets.BUNNYNET_API_KEY }}";
        };
        run = ''
          nix run .#bunny -- \
            sites deploy ./result --prod --output json
        '';
      }
    ];
  };
}
