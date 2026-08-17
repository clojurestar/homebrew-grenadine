class GrenadineAT017 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.7"
  license "EPL-1.0"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.7/grenadine-0.1.7-linux_arm64.tar.gz"
      sha256 "35621f845ca2eac5c206be36647200c6e814b29b081d47d60b05eddd8760f96f"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.7/grenadine-0.1.7-linux_amd64.tar.gz"
      sha256 "5067c10d9c744d648cae1982c10acbe8aecec29b0620597e46b41679928c8bc2"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.7/grenadine-0.1.7-darwin_arm64.tar.gz"
      sha256 "837353f02d886523a575fce48da0e11814b2255e979d2773af0b71bb339a38d5"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.7/grenadine-0.1.7-darwin_amd64.tar.gz"
      sha256 "fe0dec098434a387d3ade7fad4d914e8f2d3bcce139504ce16bd11aa5141aa14"
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
