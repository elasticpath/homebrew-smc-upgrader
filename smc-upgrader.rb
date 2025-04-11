require "formula"

class SmcUpgrader < Formula
  
  SMC_UPGRADER_VERSION = "1.1.0"

  desc "smc upgrader"
  homepage "https://github.com/elasticpath/smc-upgrader"
  url "https://github.com/elasticpath/smc-upgrader/releases/download/smc-upgrader-#{SMC_UPGRADER_VERSION}/smc-upgrader-#{SMC_UPGRADER_VERSION}.zip"
  sha256 "4db2ce8d058d08f21b997d87a7a5f0acdef00e8cb0dd1fa0cdf5bbad7db4c7dd"
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
