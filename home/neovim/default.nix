{ pkgs, system, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  /*
  home.file = {
    ".config/nvim/init.lua".source = ./init.lua;
  };
  */
  programs.nixvim = {
    enable = true;
    withPython3 = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraConfigLua = builtins.readFile ./init.lua;
    plugins = {
      nvim-surround = {
        enable = true;
      };
    };
  };
}
