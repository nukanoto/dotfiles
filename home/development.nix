{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    go
    nodejs-slim
    nodePackages.pnpm
    python3
    poetry
  ];
}
