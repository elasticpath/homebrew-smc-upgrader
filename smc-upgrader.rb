require "formula"

class SmcUpgrader < Formula
  
  SMC_UPGRADER_VERSION = "1.0.30"

  desc "smc upgrader"
  homepage "https://github.com/ep-nelsonqiao/smc-upgrader"
  url "https://github.com/ep-nelsonqiao/smc-upgrader/releases/download/smc-upgrader-#{SMC_UPGRADER_VERSION}/smc-upgrader-#{SMC_UPGRADER_VERSION}.zip"
  sha256 "02633e6f0748ad09cff4445cd7f0f564e6c4bad3db95f44bad0bc74f368f00c3"
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
    system "true"
  end
end
