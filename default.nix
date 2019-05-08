let
  localLib = import ./lib.nix; in { ... }@args:
# We will instantiate the defaul-nix template with the nix/pkgs.nix file...
localLib.nix-tools.default-nix ./nix args
# ... and add a few custom packages as well.
// { }
