{ pkgs, ... }:
let
    where-is-my-sddm =
        pkgs.callPackage ./sddm-theme.nix {};
    spotify-tui =
        pkgs.callPackage ./spotify-tui.nix {};
in
{
  environment.systemPackages = with pkgs; [
    # Core utilities
    zsh curl vim git stow wget unzip xclip cowsay oh-my-zsh tmux fzf btop psmisc emacs

    #not so core utilities
    nix-search-cli brightnessctl kdePackages.dolphin
    lxappearance docker maven tmuxinator kdePackages.gwenview

    # Terminal
    kitty foot

    # Build tools
    gcc gnumake
    clang clang-tools gdb
    cmake ninja pkg-config
    openssl_3

    # Libraries
    libevent
    ncurses
    imagemagick imagemagick.dev
    cairosvg tree-sitter ripgrep

    # Lua + luarocks
    lua51Packages.lua luarocks stylua 
    # Node + npm
    nodejs_24

    # Python
    python312 python312Packages.jupytext python312Packages.pip python312Packages.jupyter-client
    python312Packages.cairosvg python312Packages.pnglatex python312Packages.plotly python312Packages.kaleido
    python312Packages.pyperclip python312Packages.nbformat python312Packages.pillow python312Packages.tree-sitter python312Packages.pynvim
    python312Packages.wand

    #julia
    julia_111

    # Go
    go

    #rust
    rustc cargo

    # Window utilities
    rofi wofi waybar matugen swww
    blueman networkmanagerapplet pavucontrol
    grim hyprshot where-is-my-sddm.where-is-my-sddm
    spotify-tui baobab postman
    #icons
    pop-icon-theme pop-gtk-theme adwaita-icon-theme xorg.xcursorthemes

    #clipboard
    wl-clipboard cliphist xclip
    
    # Browser
    librewolf firefox
    # X11 / Mesa development libraries
    mesa
    xorg.libXrandr xorg.libXinerama xorg.libXcursor
    xorg.libX11 xorg.libXi gtk3 gtk4 vulkan-tools
    libsForQt5.qtstyleplugin-kvantum libsForQt5.qt5ct libsForQt5.qt5.qtgraphicaleffects
    # Sound
    pulseaudioFull pavucontrol pa_applet playerctl
    dunst libnotify
    #misc apps
    spotify hyprpaper 
    discord-canary

    # DBus
    dbus
    dbus.dev
    #android
    android-studio-tools android-studio
    # meetings
    zoom-us
    # minecraft
    lunar-client
    prismlauncher
    # sql 
    postgresql
    #font
    wqy_microhei
  ];
  nixpkgs.config.qt5 = {
      enable = true;
      platformTheme = "qt5ct"; 
      style = {
          package = pkgs.utterly-nord-plasma;
          name = "Utterly Nord Plasma";
      };
  };
  # Make Neovim the default editor
  programs.neovim = {
      enable = true;
      defaultEditor = true;
  }; 
  programs.java = {
      enable = true;
      package = pkgs.javaPackages.compiler.openjdk25;
  };
 programs.steam = {
     enable = true;
     extest.enable = true;
     protontricks.enable = true;
  };
  environment.variables = {
      PKG_CONFIG_PATH =
          "${pkgs.imagemagick.dev}/lib/pkgconfig:" + "${pkgs.dbus.dev}/lib/pkgconfig";
      # EDITOR = "nvim";
      # VISUAL = "nvim";
  };
  imports = [./firaMono.nix ];
}


