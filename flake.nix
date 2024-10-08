{
  description = "Personal wiki";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
    pre-commit-hooks,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      checks = {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;

          excludes = [
            "flake\.lock"
          ];

          hooks = {
            alejandra.enable = true;
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
            statix.enable = true;
            typos.enable = true;
          };
        };
      };

      devShells.default = pkgs.mkShell {
        inherit (self.checks.${system}.pre-commit-check) shellHook;
        propagatedBuildInputs = with pkgs; [
          (python3.withPackages (ps:
            with ps; [
              mkdocs
              mkdocs-material
              mkdocs-git-revision-date-localized-plugin
              pymdown-extensions
            ]))
          just
        ];
      };
    });
}
