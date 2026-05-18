class Envault < Formula
  desc "Pull secrets from LastPass or macOS Keychain into transient .env files"
  homepage "https://github.com/pubino/envault"
  version "0.1.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/pubino/homebrew-envault/releases/download/v0.1.4/envault-arm64"
    sha256 "55250b12ca745ec02cd121acf6f8b1476d03da0a11166e09ba4ecd2a709c80dd"
  else
    # Placeholder for Intel Mac binary (currently queued in CI)
    url "https://github.com/pubino/homebrew-envault/releases/download/v0.1.4/envault-x86_64"
    sha256 "intel_hash_goes_here"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "envault-arm64" => "envault"
    else
      bin.install "envault-x86_64" => "envault"
    end
  end

  test do
    system "#{bin}/envault", "--version"
  end
end
