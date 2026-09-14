class GrenadineAT0115 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.15"
  license "EPL-1.0"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.15/grenadine-0.1.15-linux_arm64.tar.gz"
      sha256 "bdd1946f9e76d06e166da0f5165d3ee9eaa2b1d18912a2a5d084fd342c9cef1f"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.15/grenadine-0.1.15-linux_amd64.tar.gz"
      sha256 "2d1bcdc05ac2a5f71e667cdc9caf3df5c9ac7c9ba2482e310d936e285303a7da"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.15/grenadine-0.1.15-darwin_arm64.tar.gz"
      sha256 "06aec6db7123ad23f9dc71109d8f5e72646b6f98f1485ba7ec6bb6cd0b90fcff"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.15/grenadine-0.1.15-darwin_amd64.tar.gz"
      sha256 "3e43f53061162f6d7319abe8ec163f3e854fec77acd7dc52769b8d464213e44a"
    else
      odie "Grenadine is not available for this macOS architecture"
    end
  end

  def install
    bin.install "grenadine"
  end

  test do
    assert_match "grenadine v#{version}", shell_output("#{bin}/grenadine --version")
  end
end
