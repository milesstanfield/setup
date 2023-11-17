# ALIASES -------------------------------------------------------------
# source all alias .sh files from ~/code/aliases
if [ -d ~/code/setup/aliases ]; then
  for path in ~/code/setup/aliases/shared/*.sh; do source $path; done
  for path in ~/code/setup/aliases/*.sh; do source $path; done
fi

# RUBY ----------------------------------------------------------------
if cmdexists rbenv; then
  export PATH="$HOME/.rbenv/bin:$PATH" # add `rbenv` cli to $PATH
  eval "$(rbenv init -)"               # load rbenv
fi

# Rust ----------------------------------------------------------------
if cmdexists rustc; then
  # https://rustup.rs/
  . "$HOME/.cargo/env"
fi

# GITHUB ------------------------------------------------------------
# https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
export GITHUB_USER=
export GITHUB_TOKEN=

# AWS -----------------------------------------------------------------
export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_DEFAULT_REGION=us-east-1

# GO! -----------------------------------------------------------------
echo "make it simple. make it awesome"
