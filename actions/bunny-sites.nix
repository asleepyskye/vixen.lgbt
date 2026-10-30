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
  concurrency = {
    group = "bunny-sites";
    cancel-in-progress = false;
  };
  jobs.deploy = {
    runs-on = "skye-ci-base-image";
    steps = [
      {
        name = "checkout";
        uses = "https://code.forgejo.org/actions/checkout@v7";
        "with" = {
          fetch-depth = 0;
        };
      }
      {
        name = "tack build patched";
        run = "nix-build .tack -A _patched || true";
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
