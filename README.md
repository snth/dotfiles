# snth/dotfiles

I now use chezmoi to manage my dotfiles.

## Set up the user

  # add the user
  adduser snth

  # grant sudo privileges
  usermod -aG sudo snth
  visudo
  # snth ALL=(ALL:ALL) ALL

  # disable password ssh authentication
  TBC

  # copy ssh config and keys
  scp ~/.ssh/config snth@localhost:~/.ssh/
  scp ~/.ssh/snth_* snth@localhost:~/.ssh/

## Install

### Atuin

  TBC

### Chezmoi

   sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init git@github.com:/snth/dotfiles.git --apply

### Starship

  curl -sS https://starship.rs/install.sh | sh

### Neovim

  # Prerequisites
  sudo apt-get install software-properties-common
  
  # Neovim
  sudo add-apt-repository ppa:neovim-ppa/unstable
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

### Python with uv

  curl -LsSf https://astral.sh/uv/install.sh | sh

### Garage S3

  # download the garage binary
  wget -O ~/.local/bin/garage https://garagehq.deuxfleurs.fr/_releases/v1.0.0/x86_64-unknown-linux-musl/garage
  mv -v garage ~/.local/bin/
  chmod +x ~/.local/bin/garage

  # create the required directories
  mkdir -v -p /data/garage/{meta,data}
  mkdir -v -p /var/log/garage/

  # generate the config
  cat > /etc/garage.toml <<EOF
  metadata_dir = "/data/garage/meta"
  data_dir = "/data/garage/data"
  db_engine = "sqlite"

  replication_factor = 1

  rpc_bind_addr = "[::]:3901"
  rpc_public_addr = "127.0.0.1:3901"
  rpc_secret = "$(openssl rand -hex 32)"

  [s3_api]
  s3_region = "garage"
  api_bind_addr = "[::]:3900"
  root_domain = ".s3.garage.localhost"

  [s3_web]
  bind_addr = "[::]:3902"
  root_domain = ".web.garage.localhost"
  index = "index.html"

  [k2v_api]
  api_bind_addr = "[::]:3904"

  [admin]
  api_bind_addr = "[::]:3903"
  admin_token = "$(openssl rand -base64 32)"
  metrics_token = "$(openssl rand -base64 32)"
  EOF

  # launch the garage server
  garage -c /etc/garage.toml server &> /var/log/garage/server.log &

  # create the cluster layout
  garage layout assign -z dc1 -c 1G <node_id>
  garage layout show
  garage layout apply --version <version_number>

  # create a bucket
  garage bucket create test-bucket

  # check the bucket
  garage bucket list
  garage bucket info test-bucket

  # create an API key
  garage key create test-key

  garage key list
  garage key info test-key

  # allow a key to access a bucket
  garage bucket allow \
    --read \
    --write \
    --owner \
    test-bucket \
    --key test-key

  garage bucket info test-bucket

  ## install and configure awscli
  uv tool install awscli

  cat > ~/.awsrc <<EOF
  export AWS_ACCESS_KEY_ID=xxxx      # put your Key ID here
  export AWS_SECRET_ACCESS_KEY=xxxx  # put your Secret key here
  export AWS_DEFAULT_REGION='garage'
  export AWS_ENDPOINT_URL='http://localhost:3900'

  aws --version
  EOF

  # add the key secret to .awsrc
  garage key info --show-secret test-key
  v ~/.awsrc

  # activate and test
  source ~/.awsrc
  aws s3 ls
  aws s3 ls s3://test

### JuiceFS

  TBC
