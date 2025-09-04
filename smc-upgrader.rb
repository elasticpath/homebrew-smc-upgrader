require "formula"

class SmcUpgrader < Formula
  
  SMC_UPGRADER_VERSION = "1.2.0"

  desc "smc upgrader"
  homepage "https://github.com/elasticpath/smc-upgrader"
  url "https://github.com/elasticpath/smc-upgrader/releases/download/smc-upgrader-#{SMC_UPGRADER_VERSION}/smc-upgrader-#{SMC_UPGRADER_VERSION}.zip"
  sha256 "a52e8d82dec605f1aac1935b4dbf10a80a069785c156da5d81654cf1c347aa1c"
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
