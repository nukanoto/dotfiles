{ pkgs, ... }:
{
  # https://daiderd.com/nix-darwin/manual/index.html#opt-services.skhd.enable
  services.skhd = {
    enable = true;
    # ref: https://qiita.com/hann-solo/items/0d8dbda76ee9f22c3ae4
    skhdConfig = ''
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      shift + alt - h : yabai -m window --warp west
      shift + alt - j : yabai -m window --warp south
      shift + alt - k : yabai -m window --warp north
      shift + alt - l : yabai -m window --warp east

      # Not to disable SIP
      # shift + alt - 1 : yabai -m window --space 1
      # shift + alt - 2 : yabai -m window --space 2
      # shift + alt - 3 : yabai -m window --space 3
      # shift + alt - 4 : yabai -m window --space 4
      # shift + alt - 5 : yabai -m window --space 5

      # toggle window native fullscreen
      shift + alt - f : yabai -m window --toggle native-fullscreen
      # toggle window fullscreen zoom
      alt - f : yabai -m window --toggle zoom-fullscreen
      # float / unfloat window and restore position
      shift + alt - space : yabai -m window --toggle float && yabai -m window --grid 4:4:1:1:2:2

      alt - e : yabai -m window --toggle split
    '';
  };
}
