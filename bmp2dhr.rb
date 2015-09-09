class Bmp2dhr < Formula
  desc "A utility for converting modern graphics to Apple II graphics"
  homepage "http://www.appleoldies.ca/bmp2dhr/"
  url "http://www.appleoldies.ca/cc65/programs/dhgr/bmp2dhr.zip"
  version "1.1"
  sha256 "5fa777cb9c35f67cee6449b90070d2ce66ccc17a49b9d97a7b303860ad3941ca"

  def install
      cd "src" do
        system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "bmp2dhr", "b2d.c"
      end
      cd "a2fcbmp" do
        system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "a2fcbmp", "a2fcbmp.c"
      end
      cd "xpack" do
        system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "xpack", "xpack.c"
      end
      bin.install "src/bmp2dhr"
      bin.install_symlink bin/"bmp2dhr" => "b2d"
      bin.install "a2fcbmp/a2fcbmp"
      bin.install_symlink bin/"a2fcbmp" => "a2b"
      bin.install "xpack/xpack"
  end

  test do
    system "false"
  end
end
