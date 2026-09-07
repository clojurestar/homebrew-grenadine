class GrenadineAT0112 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.12"
  license "EPL-1.0"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.12/grenadine-0.1.12-linux_arm64.tar.gz"
      sha256 "b4dfe683a5834eb1f05266129bd1817220b97a8abc33df202364c934fa26928a"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.12/grenadine-0.1.12-linux_amd64.tar.gz"
      sha256 "6aa7f18fcfbde5ba3f5c837e2cf8d989ca1d938a004c968318f662eb6487886c"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.12/grenadine-0.1.12-darwin_arm64.tar.gz"
      sha256 "bcc18cf51d418cd9b596e7c64a940fe89e03b54f5bcfa2fa3fa0722920115f48"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.12/grenadine-0.1.12-darwin_amd64.tar.gz"
      sha256 "15278650e67693ef3b21e7ec1eb7bfec9dedbf4a1767605f936916346e351792"
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
