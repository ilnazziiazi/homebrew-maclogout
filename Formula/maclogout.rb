class Maclogout < Formula
  desc "Force-logout scheduler for macOS — logs out during configured nighttime window"
  homepage "https://github.com/ilnazziiazi/maclogout"
  url "https://github.com/ilnazziiazi/maclogout/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7ea374f9add4509b7a492fde87ba25a405a3a4e0bc28f902498728aaa1cc840d "
  license "MIT"

  def install
    bin.install "bin/maclogout"
    (etc/"maclogout").install "share/maclogout/config"
    (prefix/"launchd").install "launchd/com.maclogout.plist"

    # Inject correct Homebrew paths for the current machine
    inreplace bin/"maclogout", "@@HOMEBREW_ETC@@", etc.to_s
    inreplace prefix/"launchd/com.maclogout.plist", "@@HOMEBREW_PREFIX@@", prefix.to_s
  end

  def caveats
    <<~EOS
      Config: #{etc}/maclogout/config

      To start the logout scheduler (runs as root daemon):
        sudo cp #{prefix}/launchd/com.maclogout.plist /Library/LaunchDaemons/
        sudo launchctl load /Library/LaunchDaemons/com.maclogout.plist

      To stop:
        sudo launchctl unload /Library/LaunchDaemons/com.maclogout.plist

      Manage config:
        maclogout --show
        sudo maclogout --start 23 --end 6

      Logs: /var/log/maclogout.log
    EOS
  end

  test do
    system "#{bin}/maclogout", "--version"
  end
end
