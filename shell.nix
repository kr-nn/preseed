{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.xorriso
    pkgs.syslinux
    pkgs.cdrkit
  ];
}

