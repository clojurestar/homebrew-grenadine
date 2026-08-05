class GrenadineAT015 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.5"
  license "MIT"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.5/grenadine-0.1.5-linux_arm64.tar.gz"
      sha256 "68eeeb09447672bb6ed33e092cf3bd17a3d1a7cd7016326abd60c9a861372b9f"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.5/grenadine-0.1.5-linux_amd64.tar.gz"
      sha256 "7c2a0b657dc1dadb2f6b098ef9e55b9ef49dcc5ce112e7fec4eb8abb31ef6d2f"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.5/grenadine-0.1.5-darwin_arm64.tar.gz"
      sha256 "509d5201f4c4043adb6d8d53aed9fe975b784b804b412dbf459edec7134ac8d6"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.5/grenadine-0.1.5-darwin_amd64.tar.gz"
      sha256 "f267431a56804c893ae7346e4659a2fee7329f3b242946c9b9d731cc46759d31"
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
