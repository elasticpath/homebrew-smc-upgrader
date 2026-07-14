require "formula"

class SmcUpgrader < Formula
  
  SMC_UPGRADER_VERSION = "2.3.0"

  desc "smc upgrader"
  homepage "https://github.com/elasticpath/smc-upgrader"
  url "https://github.com/elasticpath/smc-upgrader/releases/download/smc-upgrader-#{SMC_UPGRADER_VERSION}/smc-upgrader-#{SMC_UPGRADER_VERSION}.zip"
  sha256 "d2c5522c03c2ef8f9fbedb38cbeae57fe6992ec0c4d703ed6e01a1b0a71cbc9f"
  head "git@github.com:elasticpath/smc-upgrader.git"
  license "Apache-2.0"

  def install
    inreplace "smc-upgrader" do |s|
      s.gsub! "##PREFIX##", "#{prefix}"
    end
    bin.install "smc-upgrader"
    prefix.install "smc-upgrader-#{SMC_UPGRADER_VERSION}-jar-with-dependencies.jar"
    prefix.install "native"
  end

  test do
    assert_match "Usage: smc-upgrader", shell_output("#{bin}/smc-upgrader --help", 0)
  end
end
