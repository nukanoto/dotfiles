{
  pkgs,
  inputs,
  username,
  ...
}:
{
  imports = [
    ../../home
    ../../home/desktop-apps.nix
  ];

  programs.zsh.profileExtra = ''eval "$(/opt/homebrew/bin/brew shellenv)"'';
}
