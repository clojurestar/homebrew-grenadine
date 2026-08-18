class GrenadineAT018 < Formula
  desc "Portable Maven dependency resolver for Clojure dialects"
  homepage "https://clojurestar.github.io/grenadine/"
  version "0.1.8"
  license "EPL-1.0"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.8/grenadine-0.1.8-linux_arm64.tar.gz"
      sha256 "7db91b93cacc21a7787c96ce44f85bd2f7d146189e5a2d4dec05db4e90f5e12d"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.8/grenadine-0.1.8-linux_amd64.tar.gz"
      sha256 "d8897c0728597d39e919cc5432e6bb807194747b92ecc31361adef62c4db3008"
    else
      odie "Grenadine is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.8/grenadine-0.1.8-darwin_arm64.tar.gz"
      sha256 "bfc6e87a6c54caf43b70668c89ed244880f7ff2010465b48205d76ddbb4dc73d"
    elsif Hardware::CPU.intel?
      url "https://github.com/clojurestar/grenadine/releases/download/v0.1.8/grenadine-0.1.8-darwin_amd64.tar.gz"
      sha256 "f3ffbba0188487799744d2a652fc30475df011bba2e7cd4f6346af2015869dfa"
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
