<<<<<<< HEAD
{ pkgs, ... }:

with pkgs; [
  # General packages for development and system management
  act
=======
{ pkgs }:

with pkgs; [
  # General packages for development and system management
>>>>>>> b3202fa (Initial commit with changes)
  alacritty
  aspell
  aspellDicts.en
  bash-completion
  bat
  btop
  coreutils
<<<<<<< HEAD
  difftastic
  du-dust
  gcc
  git-filter-repo
  killall
  neofetch
  openssh
  pandoc
  sqlite
  wget
  zip

  # Encryption and security tools
  _1password
=======
  killall
  neofetch
  openssh
  sqlite
  wget
  zip
  zellij
  atuin

  # Encryption and security tools
>>>>>>> b3202fa (Initial commit with changes)
  age
  age-plugin-yubikey
  gnupg
  libfido2

  # Cloud-related tools and SDKs
<<<<<<< HEAD
  # docker
  # docker-compose
  # awscli2 - marked broken Mar 22
  flyctl
  google-cloud-sdk
  go
  gopls
  ngrok
  ssm-session-manager-plugin
  terraform
  terraform-ls
  tflint

  # Media-related packages
  emacs-all-the-icons-fonts
  imagemagick
=======
  docker
  docker-compose
  k9s
  (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])

  # Media-related packages
  spotify
  emacs-all-the-icons-fonts
>>>>>>> b3202fa (Initial commit with changes)
  dejavu_fonts
  ffmpeg
  fd
  font-awesome
<<<<<<< HEAD
  glow
  hack-font
  jpegoptim
  meslo-lgs-nf
  noto-fonts
  noto-fonts-emoji
  pngquant

  # PHP
  php82
  php82Packages.composer
  php82Packages.php-cs-fixer
  php82Extensions.xdebug
  php82Packages.deployer
  phpunit

  # Node.js development tools
  fzf
  nodePackages.live-server
  nodePackages.nodemon
  nodePackages.prettier
  nodePackages.npm
  nodejs

  # Source code management, Git, GitHub tools
  gh
=======
  hack-font
  noto-fonts
  noto-fonts-emoji
  meslo-lgs-nf
>>>>>>> b3202fa (Initial commit with changes)

  # Text and terminal utilities
  htop
  hunspell
  iftop
  jetbrains-mono
<<<<<<< HEAD
  jetbrains.phpstorm
  jq
  ripgrep
  slack
=======
  jq
  ripgrep
>>>>>>> b3202fa (Initial commit with changes)
  tree
  tmux
  unrar
  unzip
  zsh-powerlevel10k
<<<<<<< HEAD

  # Python packages
  black
  python39
  python39Packages.virtualenv
=======
  lsd
>>>>>>> b3202fa (Initial commit with changes)
]
