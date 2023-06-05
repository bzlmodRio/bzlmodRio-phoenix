load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # JVM External
    http_archive(
        name = "rules_jvm_external",
        sha256 = "f86fd42a809e1871ca0aabe89db0d440451219c3ce46c58da240c7dcdc00125f",
        strip_prefix = "rules_jvm_external-5.2",
        url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/5.2/rules_jvm_external-5.2.tar.gz",
    )

    # Bazelrio Rules
    http_archive(
        name = "rules_bazelrio",
        sha256 = "378c92e50e9f04a600b8963d4d3dab3bdb07c1ee360caacea3b4df0ede84b4c1",
        url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/0.0.10/rules_bazelrio-0.0.10.tar.gz",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_bzlmodrio_toolchains",
        sha256 = "1c566358f97b093916e150de10b65d6527ad268e5bd8bc0a0a8bfd04b390751a",
        url = "https://github.com/bzlmodRio/rules_bzlmodRio_toolchains/releases/download/2023-7/rules_bzlmodRio_toolchains-2023-7.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    # bzlmodrio-allwpilib
    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = "4c944b1e9a3de134614565f8da49bd278ee1f086615a8dcdc5e0a75692b68f13",
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/2023.3.2/bzlmodRio-allwpilib-2023.3.2.tar.gz",
    )

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "9e29725e2faddfd93213acc6bdf68406a7b630c9f01c3a6c7a6e2f1276af2d8e",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/4.6.0-4/bzlmodRio-opencv-4.6.0-4.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "8a9cc2b43691a696f07dee869765f76370cc36165f78cd0f3507efec04d7dbd7",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2023.3.0/bzlmodRio-ni-2023.3.0.tar.gz",
    )

    ########################
