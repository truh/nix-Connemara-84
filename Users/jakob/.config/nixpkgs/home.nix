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
    alacritty
    aria
    asciinema
    binutils
    circleci-cli
    cmake
    cracklib
    dos2unix
    ffmpeg
    git-crypt
    gnupg
    google-cloud-sdk
    graphviz
    htop
    httpie
    imagemagick
    inetutils
    javajdk
    jq
    kitty
    lolcat
    maven
    mpv
    nix
    nix-bundle
    nodejs-16_x
    openssh
    openssl
    openvpn
    oracle-instantclient
    p7zip
    pandoc
    pinentry-curses
    pixman
    pkg-config
    plantuml
    powershell
    pre-commit
    python3Packages.black
    python3Packages.httpx
    python3Packages.poetry
    python3Packages.pyserial
    python3Packages.xkcdpass
    rbw
    rclone
    restic
    rustup
    silver-searcher
    speedtest-cli
    tectonic
    ubuntu_font_family
    up
    vscode
    vscode
    yarn
  ];

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
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

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "direnv"
        "docker"
        "docker-compose"
        "git"
        "httpie"
	"rust"
        "yarn"
      ];
      theme = "fishy";
    };
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
