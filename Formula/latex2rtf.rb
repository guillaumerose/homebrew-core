class Latex2rtf < Formula
  desc "Translate LaTeX to RTF"
  homepage "https://latex2rtf.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/latex2rtf/latex2rtf-unix/2.3.16/latex2rtf-2.3.16.tar.gz"
  sha256 "e1538fe0dcadec28afae087cf8a6ee073e6368ca7a75728360068c6f3914b35b"

  bottle do
    sha256 "bfae90986f27ac48103f07be94fac8b11298a9418bd497e3c582a83244d49377" => :sierra
    sha256 "ce6bfc6ad26382ecdc5694f79efcc44be0b8c39b6cfc299f1c3e0a4153961e18" => :el_capitan
    sha256 "5d2225892b7ab8f89f11cfa91cb434879d2726d88ed13553fa244761cd2e15d5" => :yosemite
  end

  def install
    inreplace "Makefile", "cp -p doc/latex2rtf.html $(DESTDIR)$(SUPPORTDIR)", "cp -p doc/web/* $(DESTDIR)$(SUPPORTDIR)"
    system "make", "DESTDIR=",
                   "BINDIR=#{bin}",
                   "MANDIR=#{man1}",
                   "INFODIR=#{info}",
                   "SUPPORTDIR=#{pkgshare}",
                   "CFGDIR=#{pkgshare}/cfg",
                   "install"
  end
end
