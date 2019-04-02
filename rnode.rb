class Rnode < Formula
  desc "Offical implementation of the RChain platform."
  homepage "developer.rchain.coop"
  version "0.9.1"
  githash = "gitbf1b2c6c"
  url "https://github.com/rchain/rchain/releases/download/v#{version}/rnode-#{version}.#{githash}.tgz"
  sha256 "8677f95c3c84773ee1f8ad3ed0329b3a6a2d6686cf155ae390e0655f418e11a5"

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
