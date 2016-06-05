{ nixpkgs ? import <nixpkgs> {}, compiler ? "lts-6_0" }:

let
  inherit (nixpkgs) pkgs;
  haskellPackages = pkgs.haskell.packages.${compiler};
  project = haskellPackages.callPackage (import ./default.nix) {};
  drv = pkgs.stdenv.lib.overrideDerivation project (old : {
    buildInputs = old.buildInputs
      ++ [ (pkgs.buildHaskellEnv compiler) ];
  });
in
  if pkgs.lib.inNixShell then drv.env else drv
