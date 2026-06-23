class Macout < Formula
  desc "Lock screen scheduler for macOS — logs out during configured nighttime window"
  homepage "https://github.com/ilnazziiazi/macout"
  url "https://github.com/ilnazziiazi/macout/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"

  def install
    bin.install "bin/macout"
    (etc/"macout").install "share/macout/config"
    (prefix/"launchd").install "launchd/com.macout.plist"

    # Inject correct Homebrew paths for the current machine
    inreplace bin/"macout", "@@HOMEBREW_ETC@@", etc.to_s
    inreplace prefix/"launchd/com.macout.plist", "@@HOMEBREW_PREFIX@@", prefix.to_s
  end

  def caveats
    <<~EOS
      Config: #{etc}/macout/config

      To start the logout scheduler (runs as root daemon):
        sudo cp #{prefix}/launchd/com.macout.plist /Library/LaunchDaemons/
        sudo launchctl load /Library/LaunchDaemons/com.macout.plist

      To stop:
        sudo launchctl unload /Library/LaunchDaemons/com.macout.plist

      Manage config:
        macout --show
        sudo macout --start 23 --end 6

      Logs: /var/log/macout.log
    EOS
  end

  test do
    system "#{bin}/macout", "--version"
  end
end
