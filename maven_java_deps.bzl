load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix_api_java",
        artifact = "com.ctre.phoenix:api-java:5.20.2",
        artifact_sha256 = "ea09e2c76e2c605187782a42b1c217c1c5b64d9b2b9803045b3a1a0208d7237f",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )
    jvm_maven_import_external(
        name = "com_ctre_phoenix_wpiapi_java",
        artifact = "com.ctre.phoenix:wpiapi-java:5.20.2",
        artifact_sha256 = "64611652eae1d4da7558e3cb8267f44908670d2e2586895fbc1a1dd3bd099940",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

def setup_legacy_bzlmodrio_phoenix_java_dependencies():
    __setup_bzlmodrio_phoenix_java_dependencies(None)

setup_bzlmodrio_phoenix_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix_java_dependencies,
)
