{ pkgs ? import <nixpkgs> {}
, iohk-extras ? {}
, iohk-module ? {}
, haskell
, ...
 }:

let
  stack-pkgs = import ./pkgs.nix;

  # The Stackage release referenced in the stack config
  pkg-def = haskell.stackage.${stack-pkgs.resolver};
  # The compiler referenced in the stack config compiler = (stack-pkgs {}).compiler.nix-name;
  compiler = (stack-pkgs.extras {}).compiler or (pkg-def {}).compiler;


  pkgSet = haskell.mkStackPkgSet {
    inherit stack-pkgs;
    pkg-def-extras = [
      stack-pkgs.extras
      iohk-extras.${compiler.nix-name}
    ];
    modules = [
      iohk-module
    ];
  };

in
  pkgSet.config.hsPkgs // { _config = pkgSet.config; }
