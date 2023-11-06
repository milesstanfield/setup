[reference](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04)

# download/install various dependencies

update apt to get latest deps
```
sudo apt update
```

install some deps
```
sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
```

# download/install Ruby

download rbenv installer
```
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
```

add rbenv/bin to PATH in `~/.bashrc`
```
# add ~/.rbenv/bin to your $PATH so that you can use the rbenv command line utility
export PATH="$HOME/.rbenv/bin:$PATH"
```

add command to load rbenv in `~/.bashrc`
```
# load rbenv
eval "$(rbenv init -)"
```

source
```
source ~/.bashrc
```

verify rbenv is working
```
rbenv version
```

install a ruby version (this will take a little while)
```
rbenv install 3.0.1
```

set this version as your global version
```
rbenv global 3.0.1
```

verify ruby was installed properly
```
ruby -v
```

# installing bundler
add `~/.gemrc` with setting to skip documentation (to speed up gem installs)
```
echo "gem: --no-document" > ~/.gemrc
```

install bundler
```
gem install bundler -v 2.3.10
```

# installing rails

install rails gem
```
gem install rails -v 7.0.2.4
```

rehash to pickup ruby changes
```
rbenv rehash
```

verify rails installed correctly
```
rails -v
```

# Additional

### Updating Rbenv
Since you installed rbenv manually using Git, you can upgrade your installation to the most recent version at any time by using the git pull command in the ~/.rbenv directory:
```
cd ~/.rbenv
git pull
```

### Uninstalling rbenv
remove rbenv related things you added to your `~/.bashrc`
```
# remove these
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```

Then remove rbenv and all installed Ruby versions with the following command
```
rm -rf `rbenv root`
```
