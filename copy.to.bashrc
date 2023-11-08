# ALIASES -------------------------------------------------------------
# source all alias .sh files from ~/code/aliases
if [ -d ~/code/setup/aliases ]; then
  for filename in ~/code/setup/aliases/*.sh; do
    [ -e "$filename" ] || continue
    source $filename
  done
fi

# CUSTOM [miles] CLI -------------------------------------------------------------
if ! cmd_exists_func miles; then
  error "run the following to install [miles] cli:"
  error "sudo cp ~/code/setup/executables/miles /usr/local/bin && sudo chmod +x /usr/local/bin/miles"
fi

# RUBY ----------------------------------------------------------------
export PATH="$HOME/.rbenv/bin:$PATH" # add `rbenv` cli to $PATH
eval "$(rbenv init -)" # load rbenv

# GITHUB ------------------------------------------------------------
# https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
export GITHUB_USER=
export GITHUB_TOKEN=

# AWS -----------------------------------------------------------------
export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_DEFAULT_REGION=us-east-1

# GO! -----------------------------------------------------------------
echo "make it simple. make it awesome"
