load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # JVM External
    RULES_JVM_EXTERNAL_TAG = "4.2"
    RULES_JVM_EXTERNAL_SHA = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca"
    http_archive(
        name = "rules_jvm_external",
        sha256 = RULES_JVM_EXTERNAL_SHA,
        strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
    )

    # Bazelrio Rules
    http_archive(
        name = "rules_bazelrio",
        sha256 = "8679cf2ef1b47c184d336bfef97ac0f98fed56546b69e1a5ed02c17833bbf025",
        strip_prefix = "rules_bazelrio-0.0.9",
        url = "https://github.com/bzlmodRio/rules_bazelrio/archive/refs/tags/0.0.9.tar.gz",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_roborio_toolchain",
        sha256 = "2f37129a12941f918931d8a676156bc933f3d6437735d142fa7d8c9f0e57da48",
        strip_prefix = "rules_roborio_toolchain-2023-7",
        url = "https://github.com/bzlmodRio/rules_roborio_toolchain/archive/refs/tags/2023-7.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    # bzlmodrio-allwpilib
    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = "6c0f78beb6b28685949ec52b5b91c37a7c516a974ce08186cb62734977473cdc",
        strip_prefix = "bzlmodRio-allwpilib-2023.1.1",
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/archive/refs/tags/2023.1.1.tar.gz",
    )

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "641fb23aa8e22d8567f500fcc3c9d294412d8d55b759aee4fa67aaa6d3059b6a",
        strip_prefix = "bzlmodRio-opencv-4.6.0-4",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/archive/refs/tags/4.6.0-4.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "133a09b3743bf4c1aeeb7c2d55efd9d9452ed3d8998b050c1a0cc5788ec59ad0",
        strip_prefix = "bzlmodRio-ni-2023.3.0",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/archive/refs/tags/2023.3.0.tar.gz",
    )

    ########################
