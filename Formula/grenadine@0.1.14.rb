class GrenadineAT0114 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.14"
  license "EPL-1.0"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.14/grenadine-0.1.14-linux_arm64.tar.gz"
      sha256 "7e1302af50d8c11da055e0661d73e0b04cc47282b47c2c056b5dafafe11265fc"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.14/grenadine-0.1.14-linux_amd64.tar.gz"
      sha256 "66f8009a52d7aeac671b7ebe364da28864544c89bbca2b238cadca34799f43bb"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.14/grenadine-0.1.14-darwin_arm64.tar.gz"
      sha256 "e8083d96badc9014922a6be0cd282206fd03231a8555bcae0586c5235b7a0647"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.14/grenadine-0.1.14-darwin_amd64.tar.gz"
      sha256 "a7b65eac537f4931045b8740c83ee3cfda6cc74ddd18a72f076c062cb0f717ee"
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
