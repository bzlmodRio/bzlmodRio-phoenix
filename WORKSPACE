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
    sha256 = "f609f341d6e9090b981b3f45324d05a819fd7a5a56434f849c761971ce2c47da",
    strip_prefix = "rules_python-1.7.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/1.7.0/rules_python-1.7.0.tar.gz",
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
    sha256 = "df2e575e89b6eb0c4c9f7e3022bfa8356dc440c8c7058ba54cb2936c90ddd37f",
    url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/2026.1.1-beta-1/bzlmodRio-allwpilib-2026.1.1-beta-1.tar.gz",
)

http_archive(
    name = "bzlmodrio-opencv",
    sha256 = "27dff7aaedd00165b1a94867616ebf383220532e3956892cec649197077a9d01",
    url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/2025.4.10.0-3.bcr3/bzlmodRio-opencv-2025.4.10.0-3.bcr3.tar.gz",
)

http_archive(
    name = "bzlmodrio-ni",
    sha256 = "e8232c386bacfad08c45aaa7e625f587ec040cfb71f25a3b8f17b6abd909f38e",
    url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2026.1.0/bzlmodRio-ni-2026.1.0.tar.gz",
)

http_archive(
    name = "bzlmodrio-phoenix6",
    sha256 = "910c3fdbc019a5611a11acd08fca47ed803b743771c9bb2c5d88d2633eae207f",
    url = "https://github.com/bzlmodRio/bzlmodRio-phoenix6/releases/download/26.0.0-beta-1/bzlmodRio-phoenix6-26.0.0-beta-1.tar.gz",
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
