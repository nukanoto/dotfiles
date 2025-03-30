{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cmake
    gcc
    go
    nodePackages.pnpm
    nodejs-slim
    poetry
    python3
  ];
}
