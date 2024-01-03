load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # JVM External
    http_archive(
        name = "rules_jvm_external",
        sha256 = "d31e369b854322ca5098ea12c69d7175ded971435e55c18dd9dd5f29cc5249ac",
        strip_prefix = "rules_jvm_external-5.3",
        url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/5.3/rules_jvm_external-5.3.tar.gz",
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
        sha256 = "cd3ff046427e9c6dbc0c86a458c8cf081b8045fc3fb4265d08c0ebfc17f9cb30",
        url = "https://github.com/bzlmodRio/rules_bzlmodRio_toolchains/releases/download/2024-1/rules_bzlmodRio_toolchains-2024-1.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    # bzlmodrio-allwpilib
    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = "d47b574e3cbaf75b0719d1467f0b32135d1edee7adf0c3210a410665084834b6",
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/2024.1.1-beta-4/bzlmodRio-allwpilib-2024.1.1-beta-4.tar.gz",
    )

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "761b152ef922e6bb386b79b06830fdf085b905d132d967c31d3ab4f33b8a8366",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/2024.4.8.0-1/bzlmodRio-opencv-2024.4.8.0-1.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "f4101925d260c385f6a5c0a79451692db35f433cab8b8cc4092dd3ab93424559",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2024.2.0/bzlmodRio-ni-2024.2.0.tar.gz",
    )

    # bzlmodrio-phoenix6
    http_archive(
        name = "bzlmodrio-phoenix6",
        sha256 = "b12fa56b6bc7c9ddad14f89b60959df7b9db77f3f8905cead3bff56fe17e09e3",
        url = "https://github.com/bzlmodRio/bzlmodRio-phoenix6/releases/download/24.0.0-beta-7/bzlmodRio-phoenix6-24.0.0-beta-7.tar.gz",
    )

    ########################
