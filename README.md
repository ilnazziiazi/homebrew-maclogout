# homebrew-maclogout

Homebrew tap for [maclogout](https://github.com/ilnaz/maclogout) —
a macOS force-logout scheduler.

## Install

```bash
brew tap ilnaz/maclogout
brew install maclogout
```

## Post-install

```bash
sudo cp /opt/homebrew/opt/maclogout/launchd/com.maclogout.plist /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/com.maclogout.plist
```
