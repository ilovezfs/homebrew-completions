class DockerComposeCompletion < Formula
  desc "docker-compose completion script"
  homepage "https://docs.docker.com/compose/completion/"
  url "https://github.com/docker/compose/archive/1.8.0.tar.gz"
  sha256 "a93d702086fdc95f79d20462ddaf7cd174e3d8053b79fe3c565f0ace76a16750"
  head "https://github.com/docker/compose.git"

  conflicts_with "docker-compose",
    :because => "docker-compose already includes completion scripts"

  bottle :unneeded

  def install
    bash_completion.install "contrib/completion/bash/docker-compose"
    zsh_completion.install "contrib/completion/zsh/_docker-compose"
  end

  test do
    assert_match "-F _docker_compose",
      shell_output("bash -c 'source #{bash_completion}/docker-compose && complete -p docker-compose'")
  end
end
