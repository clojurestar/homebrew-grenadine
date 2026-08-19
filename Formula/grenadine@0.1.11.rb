class GrenadineAT0111 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.11"
  license "EPL-1.0"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.11/grenadine-0.1.11-linux_arm64.tar.gz"
      sha256 "063bf2ab557dcefcf0e85f1db66b0a111b07c9356fb007e5823b6d9c3033286a"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.11/grenadine-0.1.11-linux_amd64.tar.gz"
      sha256 "8ec3297befd53fc14763c82f3a8af720cc90d864b51a5ceef364595ccf551bad"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.11/grenadine-0.1.11-darwin_arm64.tar.gz"
      sha256 "731a20d0f5e6c1383bfbfc3408e6fda3d6daccdc930b97660ebc8b23c4b423a3"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.11/grenadine-0.1.11-darwin_amd64.tar.gz"
      sha256 "0fef1a679d6ce0ff31f74e3547511370c0f82eddb541bb7425b2c368819c3b4c"
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
