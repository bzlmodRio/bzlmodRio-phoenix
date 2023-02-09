load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_styleguide_deps():
    http_archive(
        name = "rules_pmd",
        sha256 = "6007cf19e55cb06ef4ff4933e857a833f079a57ef89b7603b0c168f46ca400d4",
        strip_prefix = "rules_pmd-6.39.0",
        url = "https://github.com/bzlmodRio/rules_pmd/archive/refs/tags/6.39.0.tar.gz",
    )
    http_archive(
        name = "rules_checkstyle",
        sha256 = "c9ad648693b72137b27e274789cdf9d1f4b7b0bdeba1ea84a572b42ac5e3aac7",
        strip_prefix = "rules_checkstyle-10.1",
        url = "https://github.com/bzlmodRio/rules_checkstyle/archive/refs/tags/10.1.tar.gz",
    )
    http_archive(
        name = "rules_wpiformat",
        sha256 = "8bef5845cb4fbc4637910522630767c2cf83d8a2370ecdf990dc4daebdb8bc50",
        strip_prefix = "rules_wpiformat-2022.30",
        url = "https://github.com/bzlmodRio/rules_wpiformat/archive/refs/tags/2022.30.tar.gz",
    )
