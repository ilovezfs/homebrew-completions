class VagrantCompletion < Formula
  desc "Bash completion for Vagrant"
  homepage "https://github.com/mitchellh/vagrant"
  url "https://github.com/mitchellh/vagrant/archive/v1.9.0.tar.gz"
  sha256 "106e2832672a48509f581f6d57af4306d9f079dbf4b01b0fb524e50bcf27a889"

  head "https://github.com/mitchellh/vagrant.git"

  bottle :unneeded

  def install
    bash_completion.install "contrib/bash/completion.sh" => "vagrant"
  end

  test do
    assert_match "-F _vagrant",
      shell_output("source #{bash_completion}/vagrant && complete -p vagrant")
  end
end
