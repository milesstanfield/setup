# install aws cli
```
sudo apt install awscli -y
```

# install aws-vault (via Homebrew)
```
brew update && \
  brew install aws-vault
```

# download, unpack, and install Session Manager plugin
```
# https://docs.aws.amazon.com/systems-manager/latest/userguide/install-plugin-debian.html

install_path=/home/$USER/Downloads/session-manager-plugin.deb && \
  curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "$install_path" && \
  sudo dpkg -i session-manager-plugin.deb
```

# verify it works
```
session-manager-plugin
```

# Configure aws config
```
mkdir -p ~/.aws; touch ~/.aws/config
```

# verify everything works
```
# if remote you'll need to VPN first
ave cr-stage-dev aws sts get-caller-identity
```
