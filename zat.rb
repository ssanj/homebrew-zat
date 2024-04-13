# typed: false
# frozen_string_literal: true

# Zat Formula
class Zat < Formula
  desc "Simple project templating system"
  homepage "https://github.com/ssanj/zat"
  url "https://github.com/ssanj/zat/archive/refs/tags/v0.11.12.tar.gz"
  version "0.11.10"
  sha256 "0663752ade36143c5ca8d5cd6644e61e984bfce80e077b33bd7fd0581a8588ce"
  license "BSD-3-Clause"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bin.install "target/release/zat"
  end

  test do
    output = shell_output("#{bin}/zat -V")
    assert_equal ["zat 0.11.12\n"], output.lines
  end
end
