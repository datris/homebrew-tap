class Datris < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Datris AI Agent-Native Data Platform"
  homepage "https://datris.ai"
  url "https://files.pythonhosted.org/packages/source/d/datris-mcp-server/datris_mcp_server-1.4.1.tar.gz"
  sha256 "d54d7ed243c882407b6afdd9ee7bfa1fb00ce46bf1740b0e109a67e72bae2804"
  license "AGPL-3.0-only"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install "datris-mcp-server==#{version}"
    bin.install_symlink Dir[libexec/"bin/datris"]
    bin.install_symlink Dir[libexec/"bin/datris-mcp-server"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datris --version")
  end
end
