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
    enable-openid-connect = true;
    steps = [
      {
        name = "checkout";
        uses = "https://code.forgejo.org/actions/checkout@v7";
        "with" = {
          fetch-depth = 0;
        };
      }
      {
        uses = "https://github.com/Mic92/niks3-action@v1.5.0";
        "with".server-url = "https://niks3.fennec-cichlid.ts.net";
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
          out=$(nix run .#bunny -- sites deploy ./result --output json)
          echo "$out"
          jq -r --arg sha "$GITHUB_SHA" -f .forgejo/deploy-summary.jq <<<"$out" >> "$FORGEJO_STEP_SUMMARY"
          jq -e .live <<<"$out" >/dev/null
        '';
      }
    ];
  };
}
