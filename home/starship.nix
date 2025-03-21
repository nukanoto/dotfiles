{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$line_break$python$character";
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };
      directory.style = "blue";
      git_status = {
        format = "[$branch]($style)";
        style = "bright-black";
      };
      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
        style = "bright-black";
      };
      python = {
        format = "[$virtualenv]($style) ";
        style = "bright-black";
      };
    };
  };
}
