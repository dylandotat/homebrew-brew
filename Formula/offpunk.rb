class Offpunk < Formula
  include Language::Python::Virtualenv

  desc "Offline-first Gemini/Web/Gopher/RSS reader and browser"
  homepage "https://offpunk.net/"
  url "https://files.pythonhosted.org/packages/source/o/offpunk/offpunk-3.1.tar.gz"
  sha256 "" # run: brew fetch --build-from-source offpunk.rb
  license "AGPL-3.0-or-later"

  depends_on "python@3.12"
  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "chafa" => :recommended
  depends_on "curl" => :recommended

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/source/b/beautifulsoup4/beautifulsoup4-4.12.3.tar.gz"
    sha256 ""
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/source/c/charset-normalizer/charset_normalizer-3.3.2.tar.gz"
    sha256 ""
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-43.0.3.tar.gz"
    sha256 ""
  end

  resource "feedparser" do
    url "https://files.pythonhosted.org/packages/source/f/feedparser/feedparser-6.0.11.tar.gz"
    sha256 ""
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.3.0.tar.gz"
    sha256 ""
  end

  resource "lxml-html-clean" do
    url "https://files.pythonhosted.org/packages/source/l/lxml-html-clean/lxml_html_clean-0.4.1.tar.gz"
    sha256 ""
  end

  resource "readability-lxml" do
    url "https://files.pythonhosted.org/packages/source/r/readability-lxml/readability-lxml-0.8.1.tar.gz"
    sha256 ""
  end

  resource "setproctitle" do
    url "https://files.pythonhosted.org/packages/source/s/setproctitle/setproctitle-1.3.3.tar.gz"
    sha256 ""
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/source/s/soupsieve/soupsieve-2.6.tar.gz"
    sha256 ""
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.17.1.tar.gz"
    sha256 ""
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-2.22.tar.gz"
    sha256 ""
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
