class Rnode < Formula
  desc "Offical implementation of the RChain platform."
  homepage "developer.rchain.coop"
  url "https://github.com/rchain/rchain/releases/download/v0.5.3/rnode-0.5.3.tgz"
  version "0.5.3"
  sha256 "83424b15d37fff2692ba40b770d22fbbf5e0d9988ecfa38de94fe0bc984b455e"

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
