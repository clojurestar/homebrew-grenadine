class GrenadineAT0113 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.13"
  license "EPL-1.0"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.13/grenadine-0.1.13-linux_arm64.tar.gz"
      sha256 "784ff99d99bdd2f515961f69e9e49c9b0d89000b7c37a561006b45637f8ae30c"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.13/grenadine-0.1.13-linux_amd64.tar.gz"
      sha256 "9222686e35a2cf1578859f4da39aa47f6433b6210d73055cff02d9fa8bccc354"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.13/grenadine-0.1.13-darwin_arm64.tar.gz"
      sha256 "39d5d6c80ef06506f3e8de465347d5d1a3185c078cd5656fb60ba3f360f6c526"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.13/grenadine-0.1.13-darwin_amd64.tar.gz"
      sha256 "a20ebfc009fe1778a3271d1887babd186094e9c7493a83e861c68daf00b8ab8d"
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
