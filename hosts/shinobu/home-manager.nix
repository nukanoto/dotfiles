{
  pkgs,
  inputs,
  username,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.${username} = import ./home.nix;
  home-manager.extraSpecialArgs = {
    inherit inputs;
    inherit username;
  };
}
