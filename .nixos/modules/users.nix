{ pkgs, ... }:

{
    users.users.ryand = {
        isNormalUser = true;
        description = "ryand";
        shell = pkgs.zsh;
        extraGroups = [ "networkmanager" "wheel" "audio" "video" "input"];
        packages = with pkgs; [];
    };
}
