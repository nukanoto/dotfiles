{ pkgs, inputs, username, ... }:
{
  imports = [
    ./yabai.nix
    ./skhd.nix
  ];

  users.users.nk = {
    name = username;
    home = "/Users/${username}";
    shell = pkgs.zsh;
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.vim
    pkgs.zsh
  ];

  fonts.packages = [
    pkgs.jetbrains-mono
  ];

  environment.shells = [ pkgs.zsh ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
  
  system = {
    defaults = {
      NSGlobalDomain.AppleShowAllExtensions = true;
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
      };
      dock = {
        autohide = true;
        show-recents = true;
        orientation = "bottom";
      };
    };
  };
}
