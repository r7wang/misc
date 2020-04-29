# Summary

Install brew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Download and install prerequisites
```bash
brew install git
brew install npm
```

Download and install ITerm2

Install zsh
```bash
brew install zsh
chsh -s /bin/zsh
```

Logout and re-login
Verify that the shell has been changed
```bash
echo $0 # should return zsh
```

Install "Oh My ZSH"
```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Close and quit ITerm2 and reopen it

Configure .zshrc
```bash
npm install --global pure-prompt
open ~/.zshrc
# Set ZSH_THEME=""
# Go to end of file and add:
#  autoload -U promptinit; promptinit
#  prompt pure
```

Change font size
```bash
# Open ITerm2 > Preferences > Profiles
# Create a new profile
# Set font size to 14pt
```

Install plugins
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
open ~/.zshrc
# Find plugins section and make sure it looks like this:
#	plugins=(
#	  git
#	  zsh-syntax-highlighting
#	  zsh-autosuggestions
#	)
source ~/.zshrc
```

Configure Word Traversal
```bash
Open iTerm2 > Preferences > Profiles > Keys
Map `⌥ ←` to action `"Send Escape Sequence" + "b"`
Map `⌥ →` to action `"Send Escape Sequence" + "f"`
```

# References
[Jazz Up Your ZSH Terminal](https://www.freecodecamp.org/news/jazz-up-your-zsh-terminal-in-seven-steps-a-visual-guide-e81a8fd59a38/)
[sindresorhus/pure](https://github.com/sindresorhus/pure)
