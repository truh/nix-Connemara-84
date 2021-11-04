{ config, pkgs, ... }:

let
  unstable = import <unstable> {};
  javajdk = pkgs.adoptopenjdk-bin;
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jakob";
  home.homeDirectory = "/Users/jakob";

  home.packages = with pkgs; [
    asciinema
    binutils
    cmake
    circleci-cli
    cracklib
    dos2unix
    vscode
    lolcat
    mpv
    openssl
    openvpn
    silver-searcher
    git-crypt
    google-cloud-sdk
    imagemagick
    inetutils
    javajdk
    jq
    gnupg
    httpie
    htop
    openssh
    pandoc
    pkg-config
    plantuml
    powershell
    pre-commit
    python3Packages.black
    python3Packages.poetry
    python3Packages.pyserial
    python3Packages.xkcdpass
    rclone
    sl
    speedtest-cli
    tectonic
    texlive.combined.scheme-medium
    ubuntu_font_family
    vscode
    (yarn.override { nodejs = nodejs-12_x; })
    youtube-dl
  ];

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    lfs.enable = true;
    userEmail = "jakob.klepp@moonvision.io";
    userName = "Jakob Klepp";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''

Host *.onion
  ProxyCommand ${pkgs.nmap}/bin/ncat --proxy-type socks5 --proxy 127.0.0.1:9050 %h %p
    '';
  };

  programs.zsh.enable = true;	

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
