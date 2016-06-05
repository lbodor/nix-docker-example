{ pkgs ? import <nixpkgs> {} }:

with pkgs;
dockerTools.buildImage {
  name = "nix-docker-example";
  contents = [ (import ./shell.nix {})  ];
  config = {
    Cmd = [ "nix-docker-example" ];
    ExposedPorts = {
      "3000/tcp" = {};
    };
  };
}
