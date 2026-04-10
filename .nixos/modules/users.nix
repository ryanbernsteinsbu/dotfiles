{ pkgs, ... }:

{
    users.users.hiego = {
        isNormalUser = true;
        description = "hiego";
        shell = pkgs.zsh;
        extraGroups = [ "networkmanager" "wheel" "audio" "video" "input"];
        packages = with pkgs; [];
    };
}
