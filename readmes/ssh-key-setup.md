# Set up your SSH key
GitHub's guide is nice and thorough so just follow it:

1. follow the instructions to create ssh key [here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) **but skip the Generating a new SSH key for a hardware security key section** at the bottom
2. follow instructions to add ssh eky to github [here](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)
3. Enable SSO by clicking the `Configure SSO` button on your new key and authorizing your company
4. your `~/.ssh/config` file should look like this (if it doesnt modify it so it does)
```
Host *
  AddKeysToAgent yes
  IgnoreUnknown UseKeychain
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```
