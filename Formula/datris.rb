class Datris < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Datris AI Agent-Native Data Platform"
  homepage "https://datris.ai"
  url "https://files.pythonhosted.org/packages/source/d/datris-mcp-server/datris_mcp_server-1.7.5.tar.gz"
  sha256 "ee3f1e1df694266110ef229bd0cba2a8c277fdddc071261a3dfb196daf51ba32"
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
