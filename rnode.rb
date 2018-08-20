class Rnode < Formula
  desc "Offical implementation of the RChain platform."
  homepage "developer.rchain.coop"
  url "https://github.com/rchain/rchain/releases/download/v0.6.1/rnode-0.6.1.tgz"
  version "0.6.1"
  sha256 "15ebe0252dc5ed27c2707afff726c659674ad7f9b8ea772f7514811dbc52427c"

  JAVA_VERSION = "1.8"

  depends_on :java => JAVA_VERSION
  depends_on "libsodium"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.mkpath
    libexec.install %w[bin lib]
    (bin/"rnode").write_env_script "#{libexec}/bin/rnode", "JAVA_HOME" => "$(#{Language::Java.java_home_cmd(JAVA_VERSION)})"
  end

  test do
    system shell_output("#{bin}/rnode --version").include?(version).to_s
  end
end
