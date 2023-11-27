- [link](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-homebrew-on-linux)

# install build tools
```
sudo apt update && \
  sudo apt-get install build-essential procps curl file git
```

# verify you have a c compiler
```
which make # should output a path
```

# download and install homebrew package
```
install_path=/home/$USER/Downloads/homebrew_install.sh && \
  curl -fsSL -o "$install_path" "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh" && \
  /bin/bash "$install_path" &&
  echo -e "\033[1;93mTAKE NOTE OF THAT OUTPUT ^^^\033[0m"
```

# Update ~/.bashrc
```
# ~/.bashrc
if test -f "/home/linuxbrew/.linuxbrew/bin/brew"; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
```

# check it all looks right
```
brew doctor
```
