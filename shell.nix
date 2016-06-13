{ nixpkgs ? import <nixpkgs> {}, compiler ? "lts-6_0" }:

let
  inherit (nixpkgs) pkgs;
  hp = pkgs.haskell.packages.${compiler};
  project = hp.callPackage (import ./default.nix) {};
  drv = pkgs.haskell.lib.addBuildTools project (
    [ hp.stack hp.hdevtools ]
  );
in
  if pkgs.lib.inNixShell then drv.env else drv
