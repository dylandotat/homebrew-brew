class Offpunk < Formula
  include Language::Python::Virtualenv

  desc "Offline-first Gemini/Web/Gopher/RSS reader and browser"
  homepage "https://offpunk.net/"
  url "https://files.pythonhosted.org/packages/source/o/offpunk/offpunk-3.1.tar.gz"
  sha256 "57b067fa32d0206f4503a178d32229c162e452ea671250892367e100b6c9fe52"
  license "AGPL-3.0-or-later"

  depends_on "python@3.12"
  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "chafa" => :recommended
  depends_on "curl" => :recommended

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/source/b/beautifulsoup4/beautifulsoup4-4.12.3.tar.gz"
    sha256 "74e3d1928edc070d21748185c46e3fb33490f22f52a3addee9aee0f4f7781051"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/source/c/charset-normalizer/charset_normalizer-3.4.1.tar.gz"
    sha256 "44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-43.0.3.tar.gz"
    sha256 "315b9001266a492a6ff443b61238f956b214dbec9910a081ba5b6646a055a805"
  end

  resource "feedparser" do
    url "https://files.pythonhosted.org/packages/source/f/feedparser/feedparser-6.0.11.tar.gz"
    sha256 "c9d0407b64c6f2a065d0ebb292c2b35c01050cc0dc33757461aaabdc4c4184d5"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.3.0.tar.gz"
    sha256 "4e109ca30d1edec1ac60cdbe341905dc3b8f55b16855e03a54aaf59e51ec8c6f"
  end

  resource "lxml-html-clean" do
    url "https://files.pythonhosted.org/packages/source/l/lxml-html-clean/lxml_html_clean-0.4.1.tar.gz"
    sha256 "40c838bbcf1fc72ba4ce811fbb3135913017b27820d7c16e8bc412ae1d8bc00b"
  end

  resource "readability-lxml" do
    url "https://files.pythonhosted.org/packages/source/r/readability-lxml/readability-lxml-0.8.1.tar.gz"
    sha256 "e51fea56b5909aaf886d307d48e79e096293255afa567b7d08bca94d25b1a4e1"
  end

  resource "setproctitle" do
    url "https://files.pythonhosted.org/packages/source/s/setproctitle/setproctitle-1.3.3.tar.gz"
    sha256 "c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/source/s/soupsieve/soupsieve-2.6.tar.gz"
    sha256 "e2e68417777af359ec65daac1057404a3c8a5455bb8abc36f1a9866ab1a51abb"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.17.1.tar.gz"
    sha256 "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-2.22.tar.gz"
    sha256 "491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      offpunk stores its cache and configuration in:
        ~/.local/share/offpunk/

      For image rendering inline, install chafa (>= 1.10) or timg (>= 1.3.2):
        brew install chafa
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/offpunk --version 2>&1")
  end
end
