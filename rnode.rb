class Rnode < Formula
  desc "Offical implementation of the RChain platform."
  homepage "developer.rchain.coop"
  version "0.9.2"
  githash = "git26ad26eb"
  url "https://github.com/rchain/rchain/releases/download/v#{version}/rnode-#{version}.#{githash}.tgz"
  sha256 "edfe1ef9aad47949ea3eab60312d0d081f3907f7097fe1f6bcdc717c93760c03"

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
