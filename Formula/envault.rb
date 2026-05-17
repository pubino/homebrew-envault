class Envault < Formula
  include Language::Python::Virtualenv

  desc "Pull secrets from LastPass or macOS Keychain into transient .env files"
  homepage "https://github.com/pubino/envault"
  url "ssh://git@github.com/pubino/envault.git", tag: "v0.1.0"
  license "MIT"

  depends_on "python@3.12"

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/d8/6e/5101f3bcb59382f94d33938114710135d6480c850239460f7ed9d7c079aa/annotated_types-0.7.0-py3-none-any.whl"
    sha256 "1f02e8b43a8fbbc3f3e0d4f0f4bfc8131bcb4eebe8849b8e5c773f3a1c582a53"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/bc/f4/353fb69038031d27995383561a7a0f6719875e533038662999e52514164b/click-8.4.0-py3-none-any.whl"
    sha256 "40c50b7c6c6adac2823d411041ec84f3f103f1b280d5e9ce0d7f998995832f81"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/49/09/a40f8983637e6f1f4ba332b719001b96a93d40dfa312d8a59f511ee14526/pydantic-2.13.4-py3-none-any.whl"
    sha256 "45a282cde31d808236fd7ea9d919b128653c8b38b393d1c4ab335c62924d9aba"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/08/9b/8724ba838f7a637d7a6b29d479c7821614917409cc92f24957e108ba5389/pydantic_core-2.46.4-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
    sha256 "8233f2947cf85404441fd7e0085f53b10c93e0ee78611099b5c7237e36aacbf7"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/88/4b/36284617415174548074d2847b744d0163351ecf420172e276f57876a47b/pyyaml-6.0.3-cp312-cp312-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
    sha256 "9149cad251584d5fb4981be1ecde53a1ca46c891a79788c0df828d2f166bda28"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/26/9f/ad63fc3511869919f9ef784260f7823f668187885827d66f8f24486926ae/typing_extensions-4.15.0-py3-none-any.whl"
    sha256 "f0fa19c6845758ab08074a0cfa8b7aecb71c999ca73d62883bc25cc018c4e548"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/3d/8c/549a37e96b83f3e2501e7e4465e90eb7707c728e83f0642436f56193796d/typing_inspection-0.4.2-py3-none-any.whl"
    sha256 "4ed1cacbdc298c220f1bd249ed5287caa16f34d44ef4e9c3d0cbad5b521545e7"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resources
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/envault"
  end

  test do
    system "#{bin}/envault", "--version"
  end
end
