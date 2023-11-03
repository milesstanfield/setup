# ALIASES -------------------------------------------------------------
# source all alias .sh files from ~/code/bash_aliases
if [ -d ~/code/setup/bash_aliases ]; then
  for filename in ~/code/setup/bash_aliases/*.sh; do
    [ -e "$filename" ] || continue
    source $filename
  done
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
