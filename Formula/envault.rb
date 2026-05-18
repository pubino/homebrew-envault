class Envault < Formula
  desc "Pull secrets from LastPass or macOS Keychain into transient .env files"
  homepage "https://github.com/pubino/envault"
  version "0.1.5"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/pubino/envault/releases/download/v0.1.5/envault-arm64"
    sha256 "00650c5705cdc21a442cc77957f173fc15803270b500865927a9d006be7ca5cf"
  else
    # Placeholder for Intel Mac binary (currently building in CI)
    url "https://github.com/pubino/envault/releases/download/v0.1.5/envault-x86_64"
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
