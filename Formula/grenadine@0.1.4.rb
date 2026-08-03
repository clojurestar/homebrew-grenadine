class GrenadineAT014 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.4"
  license "MIT"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.4/grenadine-0.1.4-linux_arm64.tar.gz"
      sha256 "ff1fc4c4a179fdc2c08612a76ab3fbeebc15c6d58566e50f266701ac9c6b26d6"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.4/grenadine-0.1.4-linux_amd64.tar.gz"
      sha256 "595b51e8a69359f32f462b4ffa998d7603301d87f40a703a43b398ff5984aeeb"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.4/grenadine-0.1.4-darwin_arm64.tar.gz"
      sha256 "27f466f70660fdfc2d0f902a9508a29c2bc01ef40984002ea44548af036a26a8"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.4/grenadine-0.1.4-darwin_amd64.tar.gz"
      sha256 "df3121ea3095eff5db574ad1dc768f35e4d383ec35b22f6345e21ec7bd10feac"
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
