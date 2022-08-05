{ stdenv, lib, fetchFromGitHub, git, unzip, xdotool, xwininfo, yad, makeWrapper
, coreutils-full, xprop, xrandr, gawk, gnugrep, strace, gamemode, mangohud
, winetricks, vkBasalt, nettools, jq, imagemagick, rsync, p7zip, findutils
, gnused, diffutils, procps, gnutar, wget, vim }:
stdenv.mkDerivation rec {
  pname = "steamtinkerlaunch";
  version = "10.0";

  src = fetchFromGitHub {
    owner = "frostworx";
    repo = "steamtinkerlaunch";
    rev = "v${version}";
    sha256 = "sha256-Fa7DXEIi9MIwj+48eGPE/sKfgy6aOZiWyJ0KrbHuhyQ=";
  };

  nativeBuildInputs = [ makeWrapper ];

  buildInputs = [
    unzip
    xdotool
    xwininfo
    yad
    coreutils-full
    diffutils
    procps
    gnutar
    wget
    vim
    gnused
    findutils
    git
    xprop
    xrandr
    gawk
    gnugrep
    strace
    gamemode
    mangohud
    winetricks
    vkBasalt
    nettools
    jq
    imagemagick
    rsync
    p7zip
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
