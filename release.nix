let
  localLib = import ./lib.nix;
in
  { cross-test ? { outPath = ./.; rev = "abcdef"; }, ... }@args:
  localLib.nix-tools.release-nix {
    _this = cross-test;
    package-set-path = ./.;

    packages = [ "cross-test" ];
  } (builtins.removeAttrs args ["cross-test"])

