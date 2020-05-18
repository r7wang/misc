# Summary

Download and install iTerm2
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew install npm
# https://www.iterm2.com/downloads.html
```

Change font size
```bash
# Open ITerm2 > Preferences > Profiles
# Create a new profile
# Set font size to 14pt
```

Configure Word Traversal
```bash
Open iTerm2 > Preferences > Profiles > Keys
Set `Left Option (⌥) Key` to `Esc+`
Map `⌥ ←` to action `"Send Escape Sequence" + "b"`
Map `⌥ →` to action `"Send Escape Sequence" + "f"`
```
