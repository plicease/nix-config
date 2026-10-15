{
  description = "Shared ARM64 macOS tools";

  inputs.nixpkgs.url =
    "github:NixOS/nixpkgs/ca1659429c95";

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};

      custom = name:
        import ./packages/${name}.nix { inherit pkgs; };

    in {
      packages.${system}.default = pkgs.buildEnv {
        name = "mac-tools";

        paths = with pkgs; [
          coreutils-prefixed
          curl
          git
          gnumake
          htop
          ncdu
          ncftp
          ripgrep
          unzip
          xz
          mariadb.client

          (custom "findutils-prefixed")
          (custom "grep-prefixed")
          (custom "inetutils-minimal")
        ];
      };
    };
}
