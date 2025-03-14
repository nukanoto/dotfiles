{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "nukanoto";
    userEmail = "nukanoto@nukanoto.net";
    lfs.enable = true;
    extraConfig = {
      # cf. https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/wsl.md#configuring-wsl-with-git-for-windows-recommended
      credential.helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
    };
  };
}
