{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "nukanoto";
        email = "me@nukanoto.net";
      };
      init.defaultBranch = "main";
    };
    lfs.enable = true;
    ignores = [
      "/.claude/"
      "/CLAUDE.md"
      ".envrc"
      ".direnv/"
      ".zed/"
    ];
  };
}
