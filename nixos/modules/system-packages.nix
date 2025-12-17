{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core utilities
    zsh curl vim git stow wget unzip xclip cowsay oh-my-zsh tmux fzf btop

    # Terminal
    kitty

    # Build tools
    gcc gnumake
    clang clang-tools gdb
    cmake ninja pkg-config

    # Libraries
    libevent
    ncurses
    imagemagick imagemagick.dev

    # Lua + luarocks
    lua51Packages.lua luarocks

    # Node + npm
    nodejs_24

    # Python
    python3
    
    #rust
    rustc cargo

    # Window utilities
    rofi
    
    # Browser
    librewolf
    # X11 / Mesa development libraries
    mesa
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXcursor
    xorg.libX11
    xorg.libXi

    # DBus
    dbus
  ];

  # Make Neovim the default editor
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
}

