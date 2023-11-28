# ALIASES -------------------------------------------------------------
# source all alias .sh files from ~/code/aliases
if [ -d ~/code/setup/aliases ]; then
  for path in ~/code/setup/aliases/shared/*.sh; do source $path; done
  for path in ~/code/setup/aliases/*.sh; do source $path; done
fi

# RUBY ----------------------------------------------------------------
export PATH="$HOME/.rbenv/bin:$PATH" # add `rbenv` cli to $PATH
if type "rbenv" &>/dev/null; then
  eval "$(rbenv init -)" # load rbenv
fi

# Rust ----------------------------------------------------------------
if type "rustc" &>/dev/null; then
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
  warn "adding 'code' to /usr/bin/code ..."
  sudo ln -s /var/lib/flatpak/exports/bin/com.visualstudio.code /usr/bin/code
fi

# GO! -----------------------------------------------------------------
echo "make it simple. make it awesome"
