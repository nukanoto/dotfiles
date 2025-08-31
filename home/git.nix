{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "nukanoto";
    userEmail = "me@nukanoto.net";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
    ignores = [
      "/.claude/"
      "/CLAUDE.md"
      ".envrc"
      ".direnv/"
    ];
  };
}
