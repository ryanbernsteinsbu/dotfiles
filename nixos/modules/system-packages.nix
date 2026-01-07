{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core utilities
    zsh curl vim git stow wget unzip xclip cowsay oh-my-zsh tmux fzf btop psmisc

    #not so core utilities
    nix-search-cli

    # Terminal
    kitty foot

    # Build tools
    gcc gnumake
    clang clang-tools gdb
    cmake ninja pkg-config

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

    #icons
    pop-icon-theme pop-gtk-theme adwaita-icon-theme xorg.xcursorthemes

    #clipboard
    wl-clipboard cliphist xclip
    
    # Browser
    librewolf
    # X11 / Mesa development libraries
    mesa
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXcursor
    xorg.libX11
    xorg.libXi
    gtk3 gtk4
    # Sound
    pulseaudioFull pavucontrol

    # DBus
    dbus
  ];

  # Make Neovim the default editor
  programs.neovim = {
      enable = true;
      defaultEditor = true;
  }; 
  programs.java = {
      enable = true;
      package = pkgs.javaPackages.compiler.openjdk24;
  };
  environment.variables = {
      PKG_CONFIG_PATH =
          "${pkgs.imagemagick.dev}/lib/pkgconfig";
  };
  imports = [./firaMono.nix];
}


