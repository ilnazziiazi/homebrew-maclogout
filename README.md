# homebrew-macout

Homebrew tap for [macout](https://github.com/ilnazziiazi/macout) —
a macOS lock screen scheduler.

## Install

```bash
brew tap ilnazziiazi/macout
brew install macout
sudo cp $(brew --prefix)/opt/macout/launchd/com.macout.plist /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/com.macout.plist
```

## Uninstall

```bash
sudo launchctl unload /Library/LaunchDaemons/com.macout.plist
sudo rm /Library/LaunchDaemons/com.macout.plist
brew uninstall macout
brew untap ilnazziiazi/macout
```
