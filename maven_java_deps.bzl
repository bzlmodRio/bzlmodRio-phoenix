load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix_api_java",
        artifact = "com.ctre.phoenix:api-java:5.30.3",
        artifact_sha256 = "123c5254cd19320def5d12e13bbe08da041a9bc50ad4d49dcb3d414762c72f85",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )
    jvm_maven_import_external(
        name = "com_ctre_phoenix_wpiapi_java",
        artifact = "com.ctre.phoenix:wpiapi-java:5.30.3",
        artifact_sha256 = "419076bb97b2fbeaaea396903cca472403847e11bcf3f0bd769bc479b2cf575e",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

def setup_legacy_bzlmodrio_phoenix_java_dependencies():
    __setup_bzlmodrio_phoenix_java_dependencies(None)

setup_bzlmodrio_phoenix_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix_java_dependencies,
)
