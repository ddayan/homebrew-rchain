class Rnode < Formula
  desc "Offical implementation of the RChain platform."
  homepage "developer.rchain.coop"
  version "0.8.3"
  url "https://github.com/rchain/rchain/releases/download/v#{version}/rnode-#{version}.tgz"
  sha256 "1d245d62c14ca36fc7eb9580a59da0588927e0b49b43991ce80d400cf77732b4"

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
