# ALIASES -------------------------------------------------------------
# source all alias .sh files from ~/code/aliases
if [ -d ~/code/setup/aliases ]; then
  for path in ~/code/setup/aliases/shared/*.sh; do source $path; done
  for path in ~/code/setup/aliases/*.sh; do source $path; done
fi

# BINME ---------------------------------------------------------------
if ! type "binme" &>/dev/null; then
  link="https://github.com/milesstanfield/binme?tab=readme-ov-file#downloadupdate"
  msg="follow these instructions to download/update binme cli:\n$link"
  echo -e "\033[1;93m$msg\033[0m"
fi

# RUBY ----------------------------------------------------------------
export PATH="$HOME/.rbenv/bin:$PATH" # add `rbenv` cli to $PATH
if test -f "$HOME/.rbenv/bin/rbenv"; then
  eval "$(rbenv init -)" # load rbenv
fi

# Rust ----------------------------------------------------------------
if test -f "$HOME/.cargo/bin/rustc"; then
  . "$HOME/.cargo/env" # https://rustup.rs/
fi

# GITHUB ------------------------------------------------------------
export GITHUB_USER=
export GITHUB_TOKEN=

# AWS -----------------------------------------------------------------
export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_DEFAULT_REGION=us-east-1
export AWS_PROFILE=

# Docker --------------------------------------------------------------
export DOCKER_COMPOSE_PATH=$HOME/code/setup/docker/docker-compose.yml

# Homebrew ------------------------------------------------------------
if test -f "/home/linuxbrew/.linuxbrew/bin/brew"; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# VSCode --------------------------------------------------------------
if ! type "code" &>/dev/null && test -f "/var/lib/flatpak/exports/bin/com.visualstudio.code"; then
  binme color print_warning "adding 'code' to /usr/bin/code ..."
  sudo ln -s /var/lib/flatpak/exports/bin/com.visualstudio.code /usr/bin/code
fi

# GO! -----------------------------------------------------------------
echo "make it simple. make it awesome"
