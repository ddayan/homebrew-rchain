class Rnode < Formula
  desc "Offical implementation of the RChain platform."
  homepage "developer.rchain.coop"
  version "0.8.1"
  url "https://github.com/rchain/rchain/releases/download/v#{version}/rnode-#{version}.tgz"
  sha256 "df67b49d5c977eb94fcc027a6e63f969e1c68a59952daa556dc861e59709dd19"

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
