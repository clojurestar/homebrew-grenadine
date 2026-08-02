class GrenadineAT013 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.3"
  license "MIT"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.3/grenadine-0.1.3-linux_arm64.tar.gz"
      sha256 "94fe730c9b520d81c08ad555030961dc5ded77a69b178c7a66955ad6e1e88735"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.3/grenadine-0.1.3-linux_amd64.tar.gz"
      sha256 "5a8360cde06882905c3735fdb61c7cc6b9d638d1ccd9717357385c8bb98076a3"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.3/grenadine-0.1.3-darwin_arm64.tar.gz"
      sha256 "a0bde6974d9557bb99d0c74dfade03f80db79617ec011df5b47c374535256b80"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.3/grenadine-0.1.3-darwin_amd64.tar.gz"
      sha256 "3d8d7a2f20c3bef0054675d8c46982078fe1704f6eb087e38d5ece4aad2cfcf5"
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
