# typed: false
# frozen_string_literal: true

# Zat Formula
class Zat < Formula
  desc "Simple project templating system"
  homepage "https://github.com/ssanj/zat"
  url "https://github.com/ssanj/zat/archive/refs/tags/v0.11.10.tar.gz"
  version "0.11.10"
  sha256 "3705bcd7c47e500b2682653b95d073e446c7bf1f7e7719056c63d0442607eb7e"
  license "BSD 3-Clause 'New' or 'Revised' License"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bin.install "target/release/zat"
  end

  test do
    output = shell_output("#{bin}/zat -V")
    assert_equal ["zat 0.11.10\n"], output.lines
  end
end
