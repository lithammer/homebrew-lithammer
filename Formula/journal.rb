class Journal < Formula
  desc "Simple journal tool for the command-line"
  homepage "https://github.com/lithammer/journal"
  url "https://github.com/lithammer/journal/archive/v0.0.1.tar.gz"
  sha256 "e6a551f48864b26f322532bd404410f14d2275d396492c446ebd84f475e5697d"
  head "https://github.com/lithammer/journal.git"

  bottle :unneeded

  depends_on "bash"
  depends_on "bash-completion@2"

  def install
    bin.install "journal"

    bash_completion.install "completions/journal.bash" => "kubectx"
    zsh_completion.install "completions/journal.zsh" => "_kubectx"
    fish_completion.install "completions/journal.fish"

    system "make", "man"
    man1.install "man/journal.1.gz"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/journal -h 2>&1")
  end
end
