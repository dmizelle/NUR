{ lib, pkgs, fetchFromGitHub, docker }:

pkgs.kodiPackages.buildKodiAddon rec {
  pname = "moonlight-qt";
  namespace = "plugin.program.moonlight-qt";
  version = "0.1.6";

  src = fetchFromGitHub {
    owner = "veldenb";
    repo = "${namespace}";
    rev = "v${version}";
    sha256 = "CYpK4bLYAk5RWulHAH/9+O5Uxsr1DSoUf/StYe3/Vgk=";
  };

  propagatedBuildInputs = [ docker ];

  meta = with lib; {
    homepage = "https://jellyfin.org/";
    description = "A whole new way to manage and view your media library";
    license = licenses.gpl3Only;
    maintainers = teams.kodi.members;
  };
}
