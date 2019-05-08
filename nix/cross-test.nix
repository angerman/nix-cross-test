{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.12";
      identifier = { name = "cross-test"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2019 Author name here";
      maintainer = "example@example.com";
      author = "Author name here";
      homepage = "https://github.com/githubuser/cross-test#readme";
      url = "";
      synopsis = "";
      description = "Please see the README on GitHub at <https://github.com/githubuser/cross-test#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = { depends = [ (hsPkgs.base) ]; };
      exes = {
        "cross-test-exe" = { depends = [ (hsPkgs.base) (hsPkgs.cross-test) ]; };
        };
      tests = {
        "cross-test-test" = {
          depends = [ (hsPkgs.base) (hsPkgs.cross-test) ];
          };
        };
      };
    } // rec { src = (pkgs.lib).mkDefault .././.; }