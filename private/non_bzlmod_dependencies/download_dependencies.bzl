load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # JVM External
    RULES_JVM_EXTERNAL_TAG = "4.5"
    RULES_JVM_EXTERNAL_SHA = "b17d7388feb9bfa7f2fa09031b32707df529f26c91ab9e5d909eb1676badd9a6"
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
        name = "rules_bzlmodrio_toolchains",
        sha256 = "b24d5813300ebe9a252c5e1c69a421c0d112f50da0d7b22c8de5efd7bca6babf",
        strip_prefix = "rules_bzlmodrio_toolchains-2023-7",
        url = "https://github.com/bzlmodRio/rules_bzlmodrio_toolchains/archive/refs/tags/2023-7.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    # bzlmodrio-allwpilib
    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = "2faa5dedf3ded5191d08638a62840ad59e938c25fc0905c9f7072d1865020479",
        strip_prefix = "bzlmodRio-allwpilib-2023.3.2",
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/archive/refs/tags/2023.3.2.tar.gz",
    )

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "7cf977af07ab17bcefc84daba4975b35f9d0696a46a7b2182ff79141fdce83a5",
        strip_prefix = "bzlmodRio-opencv-4.6.0-4-1",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/archive/refs/tags/4.6.0-4-1.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "0169bded6cc9e3fef1092bdafd3216e2f8bdcf247c9d7116f02a2a261c5350f6",
        strip_prefix = "bzlmodRio-ni-2023.3.0-1",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/archive/refs/tags/2023.3.0-1.tar.gz",
    )

    ########################
