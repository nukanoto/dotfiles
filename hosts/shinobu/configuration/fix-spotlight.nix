{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.mac-app-util.darwinModules.default
  ];

  # To enable it for all users:
  home-manager.sharedModules = [
    inputs.mac-app-util.homeManagerModules.default
  ];
}
