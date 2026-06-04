class Datris < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Datris AI Agent-Native Data Platform"
  homepage "https://datris.ai"
  url "https://files.pythonhosted.org/packages/source/d/datris-mcp-server/datris_mcp_server-1.8.3.tar.gz"
  sha256 "e2c487d95b5f51164aa448a00496c1b7bfc355894936a661d63e94b81a79c308"
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
