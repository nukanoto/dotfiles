{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          asvetliakov.vscode-neovim
          dart-code.flutter
          eamodio.gitlens
          enkia.tokyo-night
          jnoortheen.nix-ide
          ms-python.debugpy
          ms-python.python
          ms-python.vscode-pylance
          ms-vscode.cpptools-extension-pack
        ];

        keybindings = builtins.fromJSON (builtins.readFile ./keybindings.json);
        userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
        # userTasks = builtins.readFile ./tasks.json;
      };
    };
  };
}
