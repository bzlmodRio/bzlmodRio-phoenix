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
        sha256 = "ff25b5f9445cbd43759be4c6582b987d1065cf817c593eedc7ada1a699298c84",
        url = "https://github.com/wpilibsuite/rules_bzlmodRio_toolchains/releases/download/2025-1.bcr2/rules_bzlmodRio_toolchains-2025-1.bcr2.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    # bzlmodrio-allwpilib
    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = "290646b5f48678f11e428b0ee8493f259bccba2e995a32bcf704525c914c0031",
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/2025.3.2.bcr1/bzlmodRio-allwpilib-2025.3.2.bcr1.tar.gz",
    )

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "6e8544fae07ed5b4fedc146f6ad083d0d8947e3efb5332a20abc46601a52a1b5",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/2025.4.10.0-3.bcr2/bzlmodRio-opencv-2025.4.10.0-3.bcr2.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "5ee1e2d6c1a670eba178eaa5c933f31dccf550b7ab613d4b22c37ead45497c45",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2025.2.0.bcr1/bzlmodRio-ni-2025.2.0.bcr1.tar.gz",
    )

    # bzlmodrio-phoenix6
    http_archive(
        name = "bzlmodrio-phoenix6",
        sha256 = "480f258196c1d8d9bb1b77d4d240e0ff13d102c128db217375c2869b0d52c645",
        url = "https://github.com/bzlmodRio/bzlmodRio-phoenix6/releases/download/25.1.0/bzlmodRio-phoenix6-25.1.0.tar.gz",
    )

    ########################
