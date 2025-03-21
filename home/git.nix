{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "nukanoto";
    userEmail = "nukanoto@nukanoto.net";
    lfs.enable = true;
  };
}
