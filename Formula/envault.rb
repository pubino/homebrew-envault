class Envault < Formula
  include Language::Python::Virtualenv

  desc "Pull secrets from LastPass or macOS Keychain into transient .env files"
  homepage "https://github.com/pubino/envault"
  url "https://github.com/pubino/envault/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8f2f2cd6819cd3266b2fbd63b8894bde744db87277b14deea1555554f91ab3cf"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/envault"
  end

  test do
    system "#{bin}/envault", "--version"
  end
end
