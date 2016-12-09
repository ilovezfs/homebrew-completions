class TCompletion < Formula
  desc "Completion for CLI power tool for Twitter"
  homepage "http://sferik.github.com/t"
  url "https://github.com/sferik/t/archive/v3.0.0.tar.gz"
  sha256 "4dfd73b93f4855f4a477758f886e2efe41e56e47a3a4fa85e42ed6e908259f9e"
  head "https://github.com/sferik/t.git"

  bottle :unneeded

  def install
    bash_completion.install "etc/t-completion.sh" => "t"
    zsh_completion.install "etc/t-completion.zsh" => "_t"
  end

  test do
    assert_match "-F _t",
      shell_output("source #{bash_completion}/t && complete -p t")
  end
end
