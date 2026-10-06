class Datris < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Datris AI Agent-Native Data Platform"
  homepage "https://datris.ai"
  url "https://files.pythonhosted.org/packages/source/d/datris-mcp-server/datris_mcp_server-1.44.1.tar.gz"
  sha256 "c5b8ebe3afb6d50e8effe166b78bb95f80aa03b9fb3b29333f6ac0c6872867cb"
  license "AGPL-3.0-only"

  depends_on "python@3.12"

  def install
    virtualenv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/python", "-m", "pip", "install", "datris-mcp-server==#{version}"
    bin.install_symlink Dir[libexec/"bin/datris"]
    bin.install_symlink Dir[libexec/"bin/datris-mcp-server"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datris --version")
  end
end
