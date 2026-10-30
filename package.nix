{
  nodejs,
  buildNpmPackage,
}:
buildNpmPackage {
  pname = "vixen.lgbt";
  version = "0.1.0";
  src = ./.;

  inherit nodejs;
  npmDepsHash = "sha256-r2q0jftvCEIleaoKO7ePJ6ITotz1tpXWQxU8FB0vpKI=";

  installPhase = ''
    runHook preInstall
    cp -r build $out
    runHook postInstall
  '';
}
