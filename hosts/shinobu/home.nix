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
}
