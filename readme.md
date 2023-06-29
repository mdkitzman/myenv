My dotfiles, with some heavy [inspiration](https://github.com/mastermatt/myenv)

---

Setup a new Mac environment using this set of commands

```bash
mkdir -p ~/projects
cd projects
git clone git@github.com:mdkitzman/myenv.git
cd myenv
make install

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

brew bundle
source ~/.zshrc

# remove everything from the dock
defaults write com.apple.dock persistent-apps -array
killall Dock
```
