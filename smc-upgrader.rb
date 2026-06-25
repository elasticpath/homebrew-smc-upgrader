require "formula"

class SmcUpgrader < Formula
  
  SMC_UPGRADER_VERSION = "2.1.1"

  desc "smc upgrader"
  homepage "https://github.com/elasticpath/smc-upgrader"
  url "https://github.com/elasticpath/smc-upgrader/releases/download/smc-upgrader-#{SMC_UPGRADER_VERSION}/smc-upgrader-#{SMC_UPGRADER_VERSION}.zip"
  sha256 "cd8179014772287aaf60aaa2f961ccd31da0e4f8883ee2cdf1f75aec74bbad6f"
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
