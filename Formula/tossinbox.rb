require "language/node"

class Tossinbox < Formula
  desc "Disposable email inboxes for humans and AI agents (CLI + MCP server)"
  homepage "https://github.com/mohamed-khairy-5i/tossinbox"
  url "https://github.com/mohamed-khairy-5i/tossinbox/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "4b122d567525819cd8795e09d6de206f6469c7ef479c7068dcc66175ccf31164"
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
