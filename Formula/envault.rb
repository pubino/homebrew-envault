class Envault < Formula
  include Language::Python::Virtualenv

  desc "Pull secrets from LastPass or macOS Keychain into transient .env files"
  homepage "https://github.com/pubino/envault"
  url "git@github.com:pubino/envault.git", tag: "v0.1.0"
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
