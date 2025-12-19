{ pkgs, ... }:

let
  fira-monoNF-233 = pkgs.stdenvNoCC.mkDerivation {
    pname = "fira-monoNF";
    version = "2.3.3";

    src = pkgs.fetchzip {
      url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraMono.zip";
      sha256 = "sha256-vF2ugpzel2WHevp8zKqbh8lG8PUIhwvLsOJDbIVcnzI=";
      stripRoot = false;
    };

    installPhase = ''
        mkdir -p $out/share/fonts/opentype
        cp *otf $out/share/fonts/opentype/
      '';
    };
in
{
  fonts.packages = [
    fira-monoNF-233
  ];
}
