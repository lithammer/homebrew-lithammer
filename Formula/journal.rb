class Journal < Formula
  desc "Simple journal tool for the command-line"
  homepage "https://github.com/lithammer/journal"
  url "https://github.com/lithammer/journal/archive/v0.0.2.tar.gz"
  sha256 "5e0db97c4d5d543299be14b03d08878ebc2748a23d984c9265408129f08ef8db"
  head "https://github.com/lithammer/journal.git"

  bottle :unneeded

  depends_on "bash"
  depends_on "bash-completion@2" => :optional

  def install
    bin.install "journal"

    bash_completion.install "completions/journal.bash" => "journal"
    zsh_completion.install "completions/journal.zsh" => "_journal"
    fish_completion.install "completions/journal.fish"

    system "make", "man"
    man1.install "man/journal.1.gz"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/journal -h 2>&1")
  end
end
