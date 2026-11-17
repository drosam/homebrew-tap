class Hyperkey < Formula
  desc "Turn caps lock into a hyper key (shift+control+option+command)"
  homepage "https://github.com/drosam/hyperkey"
  url "https://github.com/drosam/hyperkey/releases/download/v0.2.1/hyperkey-0.2.1.zip"
  sha256 "e36693ce96d5ad80fe770543b83aa23a30634d81fba300a32d95c266a03fb145"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "hyperkey"
  end

  def caveats
    <<~EOS
      Start hyperkey now and at every login:
        brew services start hyperkey

      It runs as a LaunchAgent, so it appears under System Settings ->
      General -> Login Items & Extensions -> Allow in the Background
      (not under Open at Login).

      hyperkey needs Accessibility permission:
        System Settings -> Privacy & Security -> Accessibility
      After every `brew upgrade hyperkey`, remove and re-add (or toggle off
      and on) hyperkey there, then run `brew services restart hyperkey`.

      Do not also run a `make install` copy from source; two instances conflict.

      If caps lock stops working after a crash, clear the remap with:
        hidutil property --set '{"UserKeyMapping":[]}'
    EOS
  end

  service do
    run opt_bin/"hyperkey"
    keep_alive successful_exit: false
    log_path var/"log/hyperkey.log"
    error_log_path var/"log/hyperkey.log"
  end

  test do
    assert_equal "hyperkey #{version}", shell_output("#{bin}/hyperkey --version").strip
  end
end
