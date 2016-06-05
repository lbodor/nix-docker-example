{ mkDerivation, base, scotty, stdenv }:
mkDerivation {
  pname = "nix-docker-example";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base scotty ];
  description = "Use nix to build a docker image";
  license = stdenv.lib.licenses.bsd3;
}
