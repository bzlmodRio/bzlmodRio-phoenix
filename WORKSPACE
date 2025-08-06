workspace(name = "bzlmodrio-phoenix")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

########################
# Download Dependencies
########################
http_archive(
    name = "rules_java",
    sha256 = "1558508fc6c348d7f99477bd21681e5746936f15f0436b5f4233e30832a590f9",
    url = "https://github.com/bazelbuild/rules_java/releases/download/8.12.0/rules_java-8.12.0.tar.gz",
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "c18a69d784bcd851be95897ca0eca0b57dc86bb02e62402f15736df44160eb02",
    strip_prefix = "rules_jvm_external-6.3",
    url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/6.3/rules_jvm_external-6.3.tar.gz",
)

http_archive(
    name = "rules_python",
    sha256 = "690e0141724abb568267e003c7b6d9a54925df40c275a870a4d934161dc9dd53",
    strip_prefix = "rules_python-0.40.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.40.0/rules_python-0.40.0.tar.gz",
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "10a0d58f39a1a909e95e00e8ba0b5b1dc64d02997f741151953a2b3659f6e78c",
    strip_prefix = "protobuf-29.0",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v29.0.tar.gz"],
)

http_archive(
    name = "rules_bazelrio",
    sha256 = "0c5a98476ac5b606689863b7b9ef3f7d685c47ce2681e448ca977e8e95de31c1",
    url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/0.0.14/rules_bazelrio-0.0.14.tar.gz",
)

http_archive(
    name = "rules_bzlmodrio_toolchains",
    sha256 = "b86f16f282a767bf73a341efcbd955613e4a20aa6f1fe7f229583af68e51acf8",
    url = "https://github.com/wpilibsuite/rules_bzlmodRio_toolchains/releases/download/2025-1.bcr5/rules_bzlmodRio_toolchains-2025-1.bcr5.tar.gz",
)

http_archive(
    name = "bzlmodrio-allwpilib",
    sha256 = "290646b5f48678f11e428b0ee8493f259bccba2e995a32bcf704525c914c0031",
    url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/2025.3.2.bcr1/bzlmodRio-allwpilib-2025.3.2.bcr1.tar.gz",
)

http_archive(
    name = "bzlmodrio-opencv",
    sha256 = "27dff7aaedd00165b1a94867616ebf383220532e3956892cec649197077a9d01",
    url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/2025.4.10.0-3.bcr3/bzlmodRio-opencv-2025.4.10.0-3.bcr3.tar.gz",
)

http_archive(
    name = "bzlmodrio-ni",
    sha256 = "5ee1e2d6c1a670eba178eaa5c933f31dccf550b7ab613d4b22c37ead45497c45",
    url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2025.2.0.bcr1/bzlmodRio-ni-2025.2.0.bcr1.tar.gz",
)

http_archive(
    name = "bzlmodrio-phoenix6",
    sha256 = "30afcb65803ba71192993537b762fa8a04741ee0328c42a0cb3eccbe2324af9e",
    url = "https://github.com/bzlmodRio/bzlmodRio-phoenix6/releases/download/25.4.0/bzlmodRio-phoenix6-25.4.0.tar.gz",
)

########################

########################
# Setup Dependencies
########################

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

load("@rules_java//java:rules_java_deps.bzl", "rules_java_dependencies")

rules_java_dependencies()

load("@rules_java//java:repositories.bzl", "rules_java_toolchains")

rules_java_toolchains()

load("@bzlmodrio-phoenix//private/non_bzlmod_dependencies:setup_dependencies.bzl", "get_java_dependenicies", "setup_dependencies")

setup_dependencies()
########################

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_artifacts, maven_repositories = get_java_dependenicies()

maven_install(
    name = "maven",
    artifacts = maven_artifacts,
    repositories = maven_repositories,
    # maven_install_json = "//build_scripts/bazel/deps:maven_install.json",
)

http_archive(
    name = "rules_bzlmodrio_jdk",
    integrity = "sha256-OrJI8gl3PiEw3J54p/jtNydjMY2xRlpI1yfKfPKnIYQ=",
    strip_prefix = "rules_bzlmodrio_jdk-23a1c1fd1a9e1d1521164c854be10e3eb35e84cd",
    urls = ["https://github.com/wpilibsuite/rules_bzlmodRio_jdk/archive/23a1c1fd1a9e1d1521164c854be10e3eb35e84cd.tar.gz"],
)

load("@rules_bzlmodrio_jdk//:maven_deps.bzl", "setup_legacy_setup_jdk_dependencies")

setup_legacy_setup_jdk_dependencies()
