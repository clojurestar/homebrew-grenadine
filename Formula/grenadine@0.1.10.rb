class GrenadineAT0110 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.10"
  license "EPL-1.0"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.10/grenadine-0.1.10-linux_arm64.tar.gz"
      sha256 "1307c34abe1c7805930b3b415693742cc1e5b0ff2e4031b632246b6b464a5ac2"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.10/grenadine-0.1.10-linux_amd64.tar.gz"
      sha256 "ffc72223d6989bb1d0a760bfaaf1d9a3bb0e92d7c7ca4a47873ed43e78417209"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.10/grenadine-0.1.10-darwin_arm64.tar.gz"
      sha256 "07622ee05ed22cbeb166372c76cf6426f2a9c4852094dcacb104f4eba0caf87b"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.10/grenadine-0.1.10-darwin_amd64.tar.gz"
      sha256 "581d413bb4e1e975741ed7c59f7c0fb5f4f1c4e5807e326ea6c0960dc2706dd7"
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
