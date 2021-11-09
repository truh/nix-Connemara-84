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
    (yarn.override { nodejs = nodejs-12_x; })
    asciinema
    binutils
    circleci-cli
    cmake
    cracklib
    dos2unix
    git-crypt
    gnupg
    google-cloud-sdk
    htop
    httpie
    imagemagick
    inetutils
    javajdk
    jq
    latest.rustChannels.nightly.rust
    lolcat
    mpv
    nix-bundle
    openssh
    openssl
    openvpn
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
    silver-searcher
    sl
    speedtest-cli
    tectonic
    texlive.combined.scheme-medium
    ubuntu_font_family
    vscode
    vscode
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
    withPython3 = true;
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *.onion
        ProxyCommand ${pkgs.nmap}/bin/ncat --proxy-type socks5 --proxy 127.0.0.1:9050 %h %p
    '';
  };

  programs.fish.enable = true;
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
  };

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
