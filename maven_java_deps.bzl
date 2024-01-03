load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix_api_java",
        artifact = "com.ctre.phoenix:api-java:5.32.0-beta-5",
        artifact_sha256 = "7a08fa61e28ee4b8dd29e0dec9188d45780ec142b7844c21ba4852d8d8e98be5",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )
    jvm_maven_import_external(
        name = "com_ctre_phoenix_wpiapi_java",
        artifact = "com.ctre.phoenix:wpiapi-java:5.32.0-beta-5",
        artifact_sha256 = "9f6bbfa5c2032aa64c2eec9dab50bb35c575bd81948d86bcf567c307c516c06c",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

def setup_legacy_bzlmodrio_phoenix_java_dependencies():
    __setup_bzlmodrio_phoenix_java_dependencies(None)

setup_bzlmodrio_phoenix_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix_java_dependencies,
)
