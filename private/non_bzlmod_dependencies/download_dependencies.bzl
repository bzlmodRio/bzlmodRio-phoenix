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
        sha256 = "2b63624390bb28dd0bddcff3b24decbb34a0cead961237cc6583bef64b2fe510",
        strip_prefix = "rules_roborio_toolchain-2022-1",
        url = "https://github.com/bzlmodRio/rules_roborio_toolchain/archive/refs/tags/2022-1.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    # bzlmodrio-allwpilib
    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = "d54218d7c89f515967b2acfd311add024a1c16c4530188eb070806275a659692",
        strip_prefix = "bzlmodRio-allwpilib-2022.3.1",
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/archive/refs/tags/2022.3.1.tar.gz",
    )

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "f506a482f5f09826d065af8492844904c514374ab1745c03e1b4e3a3bad3dffd",
        strip_prefix = "bzlmodRio-opencv-4.5.2-1",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/archive/refs/tags/4.5.2-1.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "e41e562f148aef838f3153a29006d601551352a007e3d08443f616b7b67cc637",
        strip_prefix = "bzlmodRio-ni-2022.4.0",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/archive/refs/tags/2022.4.0.tar.gz",
    )

    ########################
