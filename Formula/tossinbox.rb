require "language/node"

class Tossinbox < Formula
  desc "Disposable email inboxes for humans and AI agents (CLI + MCP server)"
  homepage "https://github.com/mohamed-khairy-5i/tossinbox"
  url "https://github.com/mohamed-khairy-5i/tossinbox/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "14de057faabf65409ffa00527358afd122b31565cbac77544a1e14d2dba2c231"
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
