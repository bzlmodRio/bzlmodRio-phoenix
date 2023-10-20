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
        sha256 = "b439b1fa3ead015d8fb20f804e65fc877d28d39d337b963db011119c6c7a23a5",
        url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/0.0.13/rules_bazelrio-0.0.13.tar.gz",
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
        sha256 = "23e77cfedef9b04874161c0f53e486061251c4182be1b623c1281036bcafb72a",
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/2024.1.1-beta-1/bzlmodRio-allwpilib-2024.1.1-beta-1.tar.gz",
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
        sha256 = "cc15dcf0e83a46aa27aede4f4627bdf67170c413b15568787ac73ab371c0c10a",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2024.1.1/bzlmodRio-ni-2024.1.1.tar.gz",
    )

    ########################
