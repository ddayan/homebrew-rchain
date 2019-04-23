class Rnode < Formula
  desc "Offical implementation of the RChain platform."
  homepage "developer.rchain.coop"
  version "0.9.3"
  githash = "git50bae411"
  url "https://github.com/rchain/rchain/releases/download/v#{version}/rnode-#{version}.#{githash}.tgz"
  sha256 "73c7720671ab1cce555c3994a9bb5ac15e278c45f0eba767f4bf4c1f2082cc68"

  depends_on :java => "10+"
  depends_on "libsodium"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.mkpath
    libexec.install %w[bin lib]
    bin.write_exec_script "#{libexec}/bin/rnode"
  end

  test do
    system shell_output("#{bin}/rnode --version").include?(version).to_s
  end
end
