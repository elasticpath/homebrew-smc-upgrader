require "formula"

class SmcUpgrader < Formula
  
  SMC_UPGRADER_VERSION = "2.2.0"

  desc "smc upgrader"
  homepage "https://github.com/elasticpath/smc-upgrader"
  url "https://github.com/elasticpath/smc-upgrader/releases/download/smc-upgrader-#{SMC_UPGRADER_VERSION}/smc-upgrader-#{SMC_UPGRADER_VERSION}.zip"
  sha256 "80bbf45cdca5e88430da7d1d32ed72fd00bb9e8577f350b39d229b3cdd2417fc"
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
