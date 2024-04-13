# typed: false
# frozen_string_literal: true

# Zat Formula
class Zat < Formula
  desc "Zat - A simple project templating system"
  homepage "https://github.com/ssanj/zat"
  url "https://github.com/ssanj/zat/archive/refs/tags/v0.11.11-1-test.tar.gz"
  version "0.11.11-1-test"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "BSD 3-Clause 'New' or 'Revised' License"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--bin", "zat"
    bin.install "target/release/zat"
  end

  test do
    output = shell_output("#{bin}/zat -V")
    assert_equal ["zat 0.11.11-1-test\n"], output.lines
  end
end
