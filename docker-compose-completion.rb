class DockerComposeCompletion < Formula
  desc "docker-compose completion script"
  homepage "https://docs.docker.com/compose/completion/"
  url "https://github.com/docker/compose/archive/1.9.0.tar.gz"
  sha256 "5fdbf321e3a66c4de6d2c0e61a7504247aaf3304d6d41c557ce9131d20b0bd80"
  head "https://github.com/docker/compose.git"

  bottle :unneeded

  conflicts_with "docker-compose",
    :because => "docker-compose already includes completion scripts"

  def install
    bash_completion.install "contrib/completion/bash/docker-compose"
    zsh_completion.install "contrib/completion/zsh/_docker-compose"
  end

  test do
    assert_match "-F _docker_compose",
      shell_output("bash -c 'source #{bash_completion}/docker-compose && complete -p docker-compose'")
  end
end
