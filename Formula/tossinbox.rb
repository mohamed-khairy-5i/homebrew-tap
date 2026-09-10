require "language/node"

class Tossinbox < Formula
  desc "Disposable email inboxes for humans and AI agents (CLI + MCP server)"
  homepage "https://github.com/mohamed-khairy-5i/tossinbox"
  url "https://github.com/mohamed-khairy-5i/tossinbox/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0db0033a6f1eaeb1c9e26ee0c933a580ec4dad84c8a2362bd78721765ffb786a"
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
