{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrainsMono NF";
      font-size = 14;
      cursor-style = "block";
    };
  };
}
