let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    git
    ghc
    zlib
    haskellPackages.zlib
    haskellPackages.cabal-install
  ];

  shellHook = ''
    echo "Now in a nix shell"
  '';
}
