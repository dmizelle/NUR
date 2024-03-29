{ stdenv, lib, fetchFromGitHub, git, unzip, xdotool, xwininfo, yad, makeWrapper
, coreutils-full, xprop, xrandr, gawk, gnugrep, strace, gamemode, mangohud
, winetricks, vkBasalt, nettools, jq, imagemagick, rsync, p7zip, findutils
, gnused, diffutils, procps, gnutar, wget, vim, file, python3 }:
stdenv.mkDerivation rec {
  pname = "steamtinkerlaunch";
  version = "10.0";

  src = fetchFromGitHub {
    owner = "frostworx";
    repo = "steamtinkerlaunch";
    rev = "v${version}";
    sha256 = "sha256-Fa7DXEIi9MIwj+48eGPE/sKfgy6aOZiWyJ0KrbHuhyQ=";
  };

  #patches = [ ./001-bash-safe-mode.patch ];

  nativeBuildInputs = [ makeWrapper ];

  buildInputs = [
    coreutils-full
    diffutils
    file
    findutils
    gamemode
    gawk
    git
    gnugrep
    gnused
    gnutar
    imagemagick
    jq
    mangohud
    nettools
    p7zip
    procps
    python3
    rsync
    strace
    unzip
    vim
    vkBasalt
    wget
    winetricks
    xdotool
    xprop
    xrandr
    xwininfo
    yad
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out

    PREFIX=$out make install


    runHook postInstall
  '';

  postFixup = ''

    wrapProgram $out/bin/steamtinkerlaunch \
      --set PATH ${lib.makeBinPath buildInputs}
  '';
}
