{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrains Mono";
          style = "Regular";
        };
        size = 14;
      };
    };
  };
}