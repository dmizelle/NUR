{
  inputs = { flake-utils.url = "github:numtide/flake-utils"; };
  description = "My personal NUR repository";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: rec {
      packages =
        import ./default.nix { pkgs = import nixpkgs { inherit system; }; };
      overlay = import ./overlay.nix;
    });
}
