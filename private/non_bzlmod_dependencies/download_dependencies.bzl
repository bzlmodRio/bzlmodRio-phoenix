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
        sha256 = "0caf6c4da67b08abbb8cc619729928fa0516a0d5ce01adf4141d1dd378466bc6",
        url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/0.0.12/rules_bazelrio-0.0.12.tar.gz",
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
        sha256 = "100843ca4a248c1031cf19edb8d5aa7507d71c2e18bdd4e88f0dfa31b6bff91b",
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/2023.3.2/bzlmodRio-allwpilib-2023.3.2.tar.gz",
    )

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "b237805c8429382723aaa50885e3a5b088ef44dba29b5eee22cdadf94b50dc9f",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/4.6.0-4/bzlmodRio-opencv-4.6.0-4.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "cf1532c896bb95f4eb73c8cf5bac968f74f6986c12de141d8c4f5d8ff95cd520",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2023.3.0/bzlmodRio-ni-2023.3.0.tar.gz",
    )

    ########################
