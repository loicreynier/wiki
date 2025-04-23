{
  description = "Personal wiki";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      git-hooks,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        checks = {
          pre-commit-check = git-hooks.lib.${system}.run {
            src = ./.;

            excludes = [
              "flake\.lock"
            ];

            hooks = {
              commitizen.enable = true;
              deadnix.enable = true;
              editorconfig-checker.enable = true;
              prettier = {
                enable = true;
                settings = {
                  ignore-unknown = true;
                  check = false;
                  write = true;
                  log-level = "silent";
                };
              };
              markdownlint.enable = true;
              nixfmt-rfc-style.enable = true;
              statix.enable = true;
              typos.enable = true;
            };
          };
        };

        devShells.default = pkgs.mkShell {
          inherit (self.checks.${system}.pre-commit-check) shellHook;
          propagatedBuildInputs = with pkgs; [
            (python3.withPackages (
              ps: with ps; [
                mkdocs
                mkdocs-material
                mkdocs-git-revision-date-localized-plugin
              ]
            ))
            just
          ];
        };
      }
    );
}
