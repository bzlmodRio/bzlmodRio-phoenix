load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # Rules Java
    http_archive(
        name = "rules_java",
        sha256 = "8afd053dd2a7b85a4f033584f30a7f1666c5492c56c76e04eec4428bdb2a86cf",
        url = "https://github.com/bazelbuild/rules_java/releases/download/7.6.5/rules_java-7.6.5.tar.gz",
    )

    # JVM External
    http_archive(
        name = "rules_jvm_external",
        sha256 = "08ea921df02ffe9924123b0686dc04fd0ff875710bfadb7ad42badb931b0fd50",
        strip_prefix = "rules_jvm_external-6.1",
        url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/6.1/rules_jvm_external-6.1.tar.gz",
    )

    # Bazelrio Rules
    http_archive(
        name = "rules_bazelrio",
        sha256 = "0c5a98476ac5b606689863b7b9ef3f7d685c47ce2681e448ca977e8e95de31c1",
        url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/0.0.14/rules_bazelrio-0.0.14.tar.gz",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_bzlmodrio_toolchains",
        sha256 = "559ff5ddc402dca6266a765770c3a65db23e2060c45355c57612737bcc592b78",
        url = "https://github.com/wpilibsuite/rules_bzlmodRio_toolchains/releases/download/2025-1.bcr1/rules_bzlmodRio_toolchains-2025-1.bcr1.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    # bzlmodrio-allwpilib
    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = "None",
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/2025.1.1/bzlmodRio-allwpilib-2025.1.1.tar.gz",
    )

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "58c0069fc323259f3993750fe8245798f0db8b2fbf3772c5136253fa92912a16",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/2025.4.10.0-3/bzlmodRio-opencv-2025.4.10.0-3.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "fff62c3cb3e83f9a0d0a01f1739477c9ca5e9a6fac05be1ad59dafcd385801f7",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2025.2.0/bzlmodRio-ni-2025.2.0.tar.gz",
    )

    # bzlmodrio-phoenix6
    http_archive(
        name = "bzlmodrio-phoenix6",
        sha256 = "086d2ada6b8d55dea048944d4e2ebd38afe3b0a231afc9f4d1df3d9ec3fa8301",
        url = "https://github.com/bzlmodRio/bzlmodRio-phoenix6/releases/download/25.0.0-beta-2/bzlmodRio-phoenix6-25.0.0-beta-2.tar.gz",
    )

    ########################
