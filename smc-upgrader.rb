require "formula"

class SmcUpgrader < Formula
  
  SMC_UPGRADER_VERSION = "2.0.1"

  desc "smc upgrader"
  homepage "https://github.com/elasticpath/smc-upgrader"
  url "https://github.com/elasticpath/smc-upgrader/releases/download/smc-upgrader-#{SMC_UPGRADER_VERSION}/smc-upgrader-#{SMC_UPGRADER_VERSION}.zip"
  sha256 "bbee3b8c944a0297b353f06d45d8be2c7bfed008f67795781800d1d47f5c3ee7"
  head "git@github.com:elasticpath/smc-upgrader.git"
  license "NOASSERTION"

  def install
    inreplace "smc-upgrader" do |s|
      s.gsub! "##PREFIX##", "#{prefix}"
    end
    bin.install "smc-upgrader"
    prefix.install "smc-upgrader-#{SMC_UPGRADER_VERSION}-jar-with-dependencies.jar"
  end

  test do
    assert_match "Usage: smc-upgrader", shell_output("#{bin}/smc-upgrader --help", 0)
  end
end
