{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "nukanoto";
    userEmail = "me@nukanoto.net";
    lfs.enable = true;
  };
}
