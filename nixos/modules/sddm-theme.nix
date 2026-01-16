{pkgs, stdenv, fetchFromGitHub }:
{
  where-is-my-sddm = stdenv.mkDerivation rec {
    pname = "where-is-my-sddm";
    version = "2fddf85ec80ff02a8e20fdcba51a30b436d76e6c";
    dontBuild = true;
    src = fetchFromGitHub {
        owner = "stepanzubkov";
        repo = "where-is-my-sddm-theme";
        rev = "${version}";
        sha256 = "sha256-SNCgpgPyJf9tKE6UyvmEpSJbIfLmAmPazTF85j0W7a0=";
    };
    # cp $src/where_is_my_sddm_theme/example_configs/nord.conf $TMPDIR/theme.conf
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -a $src/where_is_my_sddm_theme/* $TMPDIR 
      cp -a $TMPDIR $out/share/sddm/themes/where_is_my_sddm_theme
    '';
  };
}
