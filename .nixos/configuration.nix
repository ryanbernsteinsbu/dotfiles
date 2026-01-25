{ config, pkgs, ... }:

{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    imports =
        [ 
            ./hardware-configuration.nix
            ./modules/system-packages.nix
            ./modules/users.nix
        ];

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    
    #dbus
    services.dbus.enable = true;
    
    #opengl
    hardware.graphics.enable = true;
    hardware.graphics.extraPackages = with pkgs; [
        vulkan-loader
            vulkan-validation-layers
            vulkan-extension-layer
    ];
    # networking
    networking.hostName = "ryand"; 
    networking.networkmanager.enable = true;

    services.resolved.enable = true;

    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    #sound
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        jack.enable = true;
        wireplumber = {
            enable = true;
            package = pkgs.wireplumber;
        };
    };
    services.pulseaudio.enable = false;

    # Set your time zone.
    time.timeZone = "America/New_York";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    # Configure keymap in X11 TODO change to wayland
    programs.hyprland = {
        enable = true;
        xwayland.enable = true; # allows X11 apps
    };

    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        extraPortals = [pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-hyprland];
    };
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "where_is_my_sddm_theme";
        extraPackages = [
            pkgs.where-is-my-sddm-theme
        ];
    };
    systemd.services.sddm = {
        enable = true;
        serviceConfig.ExecStart = "${pkgs.libsForQt5.sddm}/bin/sddm --theme /run/current-system/sw/share/sddm/themes/where_is_my_sddm_theme";
    };

    services.xserver.enable = true;
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # enable zsh
    programs.zsh = {
      enable = true;
      ohMyZsh.enable = true;
    };
    environment.variables.ZSH = pkgs.oh-my-zsh;
    environment.variables.FZF_PATH = "${pkgs.fzf}";
    environment.variables.HYPRSHOT_DIR = "/home/ryand/Screenshots/";
    environment.variables  = {
        GTK_ICON_THEME = "Pop";
        XCURSOR_THEME = "Pop";
    };
    environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

    # Allow unfree packages and allow clipboard
    virtualisation.virtualbox.host.enable = true;
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.virtualbox.host.enableExtensionPack = true;


    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    system.stateVersion = "25.05"; 
}

