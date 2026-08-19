class GrenadineAT019 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.9"
  license "EPL-1.0"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.9/grenadine-0.1.9-linux_arm64.tar.gz"
      sha256 "7142e3f21567fcc439d560e24dd8386458f8dd4c994d90c5e404c6e503d2d0bc"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.9/grenadine-0.1.9-linux_amd64.tar.gz"
      sha256 "64932dc07b89a0b2c73479989f4bea320ec3f2c33a328d5bd3f25520aa5893ba"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.9/grenadine-0.1.9-darwin_arm64.tar.gz"
      sha256 "f4fee86b875184c91f1835ed25500f68570a1cd15da608cc784799ea99a159f7"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.9/grenadine-0.1.9-darwin_amd64.tar.gz"
      sha256 "b56b4a139106da1f411470d981f7ca032e7222c3f38191fc0ad9ab38d88ab033"
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
