class DictionaryGenerator < Formula
  desc "Brotli dictionary generator tool for creating custom compression dictionaries"
  homepage "https://github.com/google/brotli"
  url "https://github.com/google/brotli.git",
      tag:      "v1.1.0",
      revision: "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
  license "MIT"
  head "https://github.com/google/brotli.git", branch: "master"

  depends_on "bazel" => :build
  depends_on "cmake" => :build

  def install
    # First build brotli using CMake
    mkdir "out" do
      system "cmake", "..", "-DCMAKE_BUILD_TYPE=Release", "-DBROTLI_BUILD_TOOLS=ON"
      system "make", "brotli"
    end

    # Then build dictionary_generator using Bazel
    # Note: Bazel 8 disables WORKSPACE by default, but brotli still uses it
    cd "research" do
      system "bazel", "build", "--enable_bzlmod=false", "dictionary_generator"
      bin.install "bazel-bin/dictionary_generator"
    end
  end

  test do
    # Test that the binary exists and runs
    assert_match "Usage:", shell_output("#{bin}/dictionary_generator --help 2>&1", 1)
  end
end

