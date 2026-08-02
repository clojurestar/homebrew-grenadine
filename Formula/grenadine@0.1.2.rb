class GrenadineAT012 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.2"
  license "MIT"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.2/grenadine-0.1.2-linux_arm64.tar.gz"
      sha256 "d850aea33927c4d25c49abb496e5aa154b723d1013b1db28b76a187504551822"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.2/grenadine-0.1.2-linux_amd64.tar.gz"
      sha256 "09036ecc98bf7c2040462eed5ca899fee4af325c26dc46464d561b4d12af6b27"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.2/grenadine-0.1.2-darwin_arm64.tar.gz"
      sha256 "1644f1959be278734df34074e490381c88f631bdb66fd2715d774874b69fdbd2"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.2/grenadine-0.1.2-darwin_amd64.tar.gz"
      sha256 "f34cd1e96ce9da7893db19559db1c2d576b02c4ee7bd6f8fa8545a88748d835e"
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
