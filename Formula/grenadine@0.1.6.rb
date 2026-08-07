class GrenadineAT016 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.6"
  license "EPL-1.0"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.6/grenadine-0.1.6-linux_arm64.tar.gz"
      sha256 "39cf446f70fed37fc2fc51728ff7ede02a3ab567bbb36bec7a43fdf43a4afd25"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.6/grenadine-0.1.6-linux_amd64.tar.gz"
      sha256 "7154b8b603b32fc519efe7d651306bb733ba15dd0c6c4a3348f81f122a120d92"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.6/grenadine-0.1.6-darwin_arm64.tar.gz"
      sha256 "d50f774b1f5674e3d3fae68d722e1cc55a46b44dcce06f9996370003abaa0450"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.6/grenadine-0.1.6-darwin_amd64.tar.gz"
      sha256 "95f191e296d40f2c7971b819fb26e63b560e841d5c0bd6157ccd180f1089ec4f"
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
