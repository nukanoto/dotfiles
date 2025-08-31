{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrainsMono NF";
      font-size = 14;
      font-feature = "-dlig,-liga,-calt";
      cursor-style = "block";
    };
  };
}
