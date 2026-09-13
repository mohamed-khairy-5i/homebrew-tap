require "language/node"

class Tossinbox < Formula
  desc "Disposable email inboxes for humans and AI agents (CLI + MCP server)"
  homepage "https://github.com/mohamed-khairy-5i/tossinbox"
  url "https://github.com/mohamed-khairy-5i/tossinbox/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "f5b4be2134964ab3c12fa2c6322475dd1a2e08d775a81f46a837ada68d87bc63"
  license "MIT"

  depends_on "node"

  def install
    (libexec/"tossinbox").install Dir["*"]
    cd libexec/"tossinbox" do
      system "npm", "install", "--omit=dev", "--ignore-scripts"
    end

    bin.install_symlink libexec/"tossinbox/dist/cli.js" => "tossinbox"
    bin.install_symlink libexec/"tossinbox/dist/mcp.js" => "tossinbox-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tossinbox --version")
    assert_match "tossinbox", shell_output("#{bin}/tossinbox --help")
  end
end
