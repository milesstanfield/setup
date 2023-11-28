# Setup Pop!_OS on new linux
- install popos
- setup wifi
- login to github.com
- go to [milesstanfield/setup/readmes/ssh-key-setup.md](https://github.com/milesstanfield/setup/blob/main/readmes/ssh-key-setup.md) and setup ssh
- `cd ~/ && mkdir code && cd code && git clone git@github.com:milesstanfield/setup.git`
- `cp ~/code/setup/copy.to.bashrc ~/.bashrc`
- `source ~/.bashrc`
- [install Ruby](https://github.com/milesstanfield/setup/blob/main/readmes/rails-setup.md)
- `restoredependencies` # this will take quite a while
- 1password
  - open 1password on another machine
  - click profile dropdown > Set Up Another Device > reveal secret key
  - Open 1password on new device `/opt/1Password/1password %U`
  - sign in with Account Details + secret you just collected.
  - get saved Github token out of 1password and update `GITHUB_TOKEN` in `~/.bashrc` with it
  - update `GITHUB_USER` var while your in `~/.bashrc` too
- `restoresettings`


# settings not restored (currently)
- chrome default search engine (duckduckgo)
- chrome duckduckgo settings
- chrome bookmarks
- slack dark mode
