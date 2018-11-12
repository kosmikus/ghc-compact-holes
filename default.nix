with (import ./nixpkgs.nix) {};

let

  ghc-compact-holes = callPackage ./ghc-compact-holes.nix {};
  ghc-compact-holes-pkgs = with haskell.lib; haskell.packages.ghc862.override {
    ghc = ghc-compact-holes;
    overrides = self : super : {
      mkDerivation = args : super.mkDerivation (args // {
        doCheck = false;
        jailbreak = true;
      });
    };
  };
  ghc-compact-holes-with-pkgs =
    ghc-compact-holes-pkgs.ghcWithPackages ( pkgs : [
    ]);

in

  ghc-compact-holes-with-pkgs
