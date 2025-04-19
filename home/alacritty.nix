{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrainsMono NF";
          style = "Regular";
        };
        size = 14;
      };
    };
  };
}