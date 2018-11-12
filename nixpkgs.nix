{ _nixpkgs ? import <nixpkgs> {} } :

let

  nixpkgs = import (_nixpkgs.fetchFromGitHub {
    owner  = "NixOS";
    repo   = "nixpkgs";
    rev    = "1de9c8a023a4000e250e07f18d42b900c6db6cf8";
    sha256 = "0lzspskk6njcpzc4f1nsifr8c0jfv1wa2y7wx2p9zzlaj4ryn284";
  }) { overlays = [ cabalHashes ]; };

  cabalHashes = self : super : {
    all-cabal-hashes = self.fetchurl {
      url    = "https://github.com/commercialhaskell/all-cabal-hashes/archive/93cf13847d3118be35156354959f8ef334596cf9.tar.gz";
      sha256 = "0bbq333jhn37lvn976yh5c2h5na9br2vpxr3zg96kncg6va8949a";
    };
  };

in

  nixpkgs
