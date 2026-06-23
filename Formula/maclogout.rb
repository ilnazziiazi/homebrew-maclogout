class Maclogout < Formula
  desc "Force-logout scheduler for macOS — logs out during configured nighttime window"
  homepage "https://github.com/ilnaz/maclogout"
  url "https://github.com/ilnaz/maclogout/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"

  def install
    bin.install "bin/maclogout"
    (etc/"maclogout").install "share/maclogout/config"
    (prefix/"launchd").install "launchd/com.maclogout.plist"
  end

  def caveats
    <<~EOS
      Config: #{etc}/maclogout/config

      To start the logout scheduler (runs as root daemon):
        sudo cp #{prefix}/launchd/com.maclogout.plist /Library/LaunchDaemons/
        sudo launchctl load /Library/LaunchDaemons/com.maclogout.plist

      To stop:
        sudo launchctl unload /Library/LaunchDaemons/com.maclogout.plist

      Logs: /var/log/maclogout.log
    EOS
  end

  test do
    system "#{bin}/maclogout", "--version"
  end
end
