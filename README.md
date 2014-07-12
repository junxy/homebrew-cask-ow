homebrew-cask-ow
================

## Overview


## Requirements

### Install Homebrew
```bash
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

### Install Homebrew-cask
```bash
$ brew tap caskroom/cask
$ brew install brew-cask
```
[try it!](https://github.com/caskroom/homebrew-cask#lets-try-it)
```
$ brew cask install google-chrome
=> Downloading https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
=> Success! google-chrome installed to /opt/homebrew-cask/Caskroom/google-chrome/stable-channel
=> Linking Google Chrome.app to /Users/phinze/Applications/Google Chrome.app

$ open ~/Applications/"Google Chrome.app"
```

## How to use

##### JDK7
```bash
$ brew cask install https://raw.githubusercontent.com/junxy/homebrew-cask-ow/master/Casks/java7.rb
```

##### JDK8
```
$ brew cask install https://raw.githubusercontent.com/junxy/homebrew-cask-ow/master/Casks/java.rb
```

##### Phpstorm:
```
$ brew cask install https://raw.githubusercontent.com/junxy/homebrew-cask-ow/master/Casks/phpstorm.rb
```

##### IntellijIdea: 
```
$ brew cask install https://raw.githubusercontent.com/junxy/homebrew-cask-ow/master/Casks/intellij-idea.rb
```

## FAQ
