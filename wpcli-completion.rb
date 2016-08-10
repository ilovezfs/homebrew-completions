class WpcliCompletion < Formula
  desc "Bash completion for Wpcli"
  homepage "https://github.com/wp-cli/wp-cli"
  url "https://github.com/wp-cli/wp-cli/archive/v0.24.1.tar.gz"
  sha256 "df6dc42349fbe658c8c5a4fb2664b0eefe74a1fa4fba163f7db047fe4200c512"

  head "https://github.com/wp-cli/wp-cli.git"

  bottle :unneeded

  def install
    bash_completion.install "utils/wp-completion.bash" => "wp"
  end

  test do
    assert_match "-F _wp_complete",
      shell_output("source #{bash_completion}/wp && complete -p wp")
  end
end
