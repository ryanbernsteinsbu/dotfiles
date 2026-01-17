{stdenv, fetchurl }:
stdenv.mkDerivation rec {
    pname = "spotify-tui";
    version = "0.25.0";
    dontBuild = true;
    sourceRoot = ".";
    src = fetchurl {
        url = "https://github.com/Rigellute/spotify-tui/releases/download/v${version}/spotify-tui-linux.tar.gz";
        sha256 = "sha256-P6KCrE+0xFVe8Fuu7JnKT+Dbz+QvWnw76hL2iTuI0eA=";
    };
    installPhase = ''
        mkdir -p $out/bin
        cp spt $out/bin/spt
        chmod +x $out/bin/spt
    '';
}

