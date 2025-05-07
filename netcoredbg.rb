class Netcoredbg < Formula
  desc "The NetCoreDbg debugger implements GDB/MI and VSCode Debug Adapter Protocol in a unified framework, allowing the debugging of .NET apps under the .NET Core runtime as well as facilitating debugging from the command line (such as in GDB)."
  homepage "https://github.com/Samsung/netcoredbg"
  url "https://github.com/Samsung/netcoredbg/archive/refs/tags/3.1.2-1054.tar.gz"
  sha256 "2699f6dd0275c5943339183fc5c7e5c0cdfe77a23388a9fdab3f2c6929ff40a7"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "dotnet" => :build

  def install
    mkdir "build" do
      system "cmake", "..", "-DCMAKE_POLICY_VERSION_MINIMUM=3.5", 
                            "-DCMAKE_INSTALL_PREFIX=#{prefix}",
                            "CC=clang",
                            "CXX=clang++"
      system "make"
      system "make", "install"
    end
  end

  test do
    assert_match "version", shell_output("#{bin}/netcoredbg --version")
  end
end