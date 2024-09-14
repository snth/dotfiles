# snth/dotfiles

I now use chezmoi to manage my dotfiles.

## Install

### Chezmoi

   sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply git@github.com:/snth/dotfiles.git

### Starship

  curl -sS https://starship.rs/install.sh | sh

### Neovim

  # Prerequisites
  sudo apt-get install software-properties-common
  
  # Neovim
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt-get update
  sudo apt-get install neovim

  # Python Prerequisites
  sudo apt-get install python-dev python-pip python3-dev python3-pip

### LazyVim

  git clone https://github.com/LazyVim/starter ~/.config/nvim
  nvim

### tmux

  sudo apt instal tmux

### Rust

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

### Atuin

  TBC

### Garage S3

  TBC

### JuiceFS

  TBC
