# homebrew-maclogout

Homebrew tap for [maclogout](https://github.com/ilnazziiazi/maclogout) —
a macOS force-logout scheduler.

## Install

```bash
brew tap ilnazziiazi/maclogout
brew install maclogout
sudo cp $(brew --prefix)/opt/maclogout/launchd/com.maclogout.plist /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/com.maclogout.plist
```

## Uninstall

```bash
sudo launchctl unload /Library/LaunchDaemons/com.maclogout.plist
sudo rm /Library/LaunchDaemons/com.maclogout.plist
brew uninstall maclogout
brew untap ilnazziiazi/maclogout
```
