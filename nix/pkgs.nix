{
  extras = hackage:
    {
      packages = {
        "transformers" = (((hackage.transformers)."0.5.6.2").revisions).default;
        "process" = (((hackage.process)."1.6.5.0").revisions).default;
        } // { cross-test = ./cross-test.nix; };
      };
  resolver = "lts-13.19";
  }