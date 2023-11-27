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
# https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
export GITHUB_USER=
export GITHUB_TOKEN=

# AWS -----------------------------------------------------------------
export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_DEFAULT_REGION=us-east-1

# Docker
export DOCKER_COMPOSE_PATH=/home/$USER/code/setup/docker/docker-compose.yml

# VSCode
if ! type "code" &>/dev/null && test -f "/var/lib/flatpak/exports/bin/com.visualstudio.code"; then
  warn "adding 'code' to /usr/bin/code ..."
  sudo ln -s /var/lib/flatpak/exports/bin/com.visualstudio.code /usr/bin/code
fi

# GO! -----------------------------------------------------------------
echo "make it simple. make it awesome"
