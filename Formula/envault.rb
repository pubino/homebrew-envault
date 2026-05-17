class Envault < Formula
  include Language::Python::Virtualenv

  desc "Pull secrets from LastPass or macOS Keychain into transient .env files"
  homepage "https://github.com/pubino/envault"
  url "ssh://git@github.com/pubino/envault.git", tag: "v0.1.1"
  version "0.1.1"
  license "MIT"

  depends_on "python@3.12"

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/6e/8b/6e1f4ba332b719001b96a93d40dfa312d8a59f511ee14526/click-8.4.0.tar.gz"
    sha256 "638f1338fe1235c8f4e008e4a8a254fb5c5fbdcbb40ece3c9142ebb78e792973"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/08/9b/8724ba838f7a637d7a6b29d479c7821614917409cc92f24957e108ba5389/pydantic-2.13.4.tar.gz"
    sha256 "c40756b57adaa8b1efeeced5c196f3f3b7c435f90e84ea7f443901bec8099ef6"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/4c/08/9b8724ba838f7a637d7a6b29d479c7821614917409cc92f24957e108ba5389/pydantic_core-2.46.4.tar.gz"
    sha256 "62f875393d7f270851f20523dd2e29f082bcc82292d66db2b64ea71f64b6e1c1"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/ed/23/7a778b6bd0b9a8039df8b1b1d80e2e2ad78aa04171592c8a5c43a56a6af4/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/18/67/36e9267722cc04a6b9f15c7f3441c2363321a3ea07da7ae0c0707beb2a9c/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/dc/9b/47798a6c91d8bdb567fe2698fe81e0c6b7cb7ef4d13da4114b41d239f65d/typing_inspection-0.4.2.tar.gz"
    sha256 "ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464"
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
