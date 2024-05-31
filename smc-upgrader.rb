require "formula"

class SmcUpgrader < Formula
  
  SMC_UPGRADER_VERSION = "1.0.0"

  desc "smc upgrader"
  homepage "https://github.com/ep-nelsonqiao/smc-upgrader"
  url "https://github.com/ep-nelsonqiao/smc-upgrader/releases/download/smc-upgrader-#{SMC_UPGRADER_VERSION}/smc-upgrader-#{SMC_UPGRADER_VERSION}.zip"
  sha256 "6aeea38f7d1b49fb98619542860fefe2981faa66a5c267089ff7bb8dd3daf8b6"
  head "https://github.com/ep-nelsonqiao/smc-upgrader.git"
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
