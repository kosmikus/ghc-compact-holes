with (import ./nixpkgs.nix) {};

let
  ghc-compact-holes-with-pkgs = import ./ghc-pkgs.nix;
in
  stdenv.mkDerivation rec {
    name = "ghc-compact-holes-env";
    env = buildEnv {
      inherit name;
      paths = buildInputs;
    };
    buildInputs = [ ghc-compact-holes-with-pkgs ];
  }
