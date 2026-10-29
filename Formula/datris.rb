class Datris < Formula
  include Language::Python::Virtualenv

  desc "CLI for Datris, the data control plane for AI agents"
  homepage "https://datris.ai"
  url "https://files.pythonhosted.org/packages/source/d/datris-mcp-server/datris_mcp_server-1.54.1.tar.gz"
  sha256 "c019533c72d39060fe02f543961a83cc3b632970130f2a9e48ea25310bc582f3"
  license "Apache-2.0"

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
