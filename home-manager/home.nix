{ config, pkgs, ... }:

{
  imports = [
    ./apps/zsh.nix
    ./apps/micro.nix
    ./apps/git.nix
  ];
  home.username = "dave";
  home.homeDirectory = "/home/dave";
  home.packages = with pkgs; [
    neovim
    firefox
    fd
    git
    ripgrep
    tree
    exa
    zoxide
    bat
    fontconfig
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    tmux
  ];


  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batwatch
        prettybat
      ];
    };
    bottom = {
      enable = true;
      settings = {
        colors = {
          high_battery_color = "green";
          medium_battery_color = "yellow";
          low_battery_color = "red";
        };
        disk_filter = {
          is_list_ignored = true;
          list = ["/dev/loop"];
          regex = true;
          case_sensitive = false;
          whole_word = false;
        };
        flags = {
          dot_marker = false;
          enable_gpu_memory = true;
          group_processes = true;
          hide_table_gap = true;
          mem_as_value = true;
          tree = true;
        };
      };
    };
    command-not-found.enable = true;
    dircolors = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };
    exa = {
      enable = true;
      enableAliases = true;
      icons = true;
    };
    gpg.enable = true;
    home-manager.enable = true;
    info.enable = true;
    jq.enable = true;
    powerline-go = {
      enable = true;
      settings = {
        cwd-max-depth = 5;
        cwd-max-dir-size = 12;
        max-width = 60;
      };
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryFlavor = "curses";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}
