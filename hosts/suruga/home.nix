{
  pkgs,
  inputs,
  username,
  ...
}:
{
  imports = [
    ../../home
  ];
  
  programs.git.extraConfig.credential.helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
}
