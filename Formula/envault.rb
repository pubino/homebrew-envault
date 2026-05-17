class Envault < Formula
  include Language::Python::Virtualenv

  desc "Pull secrets from LastPass or macOS Keychain into transient .env files"
  homepage "https://github.com/pubino/envault"
  url "https://github.com/pubino/envault/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fd264845ba5ac884abcf25d9277bf60fa948ee2ed8645829c66cb178d50c2d69"
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
