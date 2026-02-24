class OpenscadLsp < Formula
  desc "Language Server Protocol (LSP) server for OpenSCAD"
  homepage "https://github.com/Leathong/openscad-LSP"
  url "https://github.com/Leathong/openscad-LSP/releases/download/v2.0.1/source.tar.gz"
  sha256 "29d77a5af5eaf091883a7157502f89fa0d1f969eff1d0fa56221b801835d2281"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/Leathong/openscad-LSP.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def rpc(json)
    "Content-Length: #{json.bytesize}\r\n\r\n#{json}"
  end

  test do
    input = rpc <<~JSON
      {"jsonrpc":"2.0","id":1,"method":"initialize","params":{"rootUri":"file:///tmp","capabilities":{}}}
    JSON
    input << rpc(<<~JSON)
      {"jsonrpc":"2.0","method":"initialized","params":{}}
    JSON
    input << rpc(<<~JSON)
      {"jsonrpc":"2.0","id":2,"method":"shutdown","params":null}
    JSON
    input << rpc(<<~JSON)
      {"jsonrpc":"2.0","method":"exit","params":null}
    JSON

    output = pipe_output("#{bin}/openscad-lsp --stdio", input, 0)
    assert_match "Content-Length:", output
  end
end
