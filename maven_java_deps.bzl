load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix_api_java",
        artifact = "com.ctre.phoenix:api-java:5.30.2",
        artifact_sha256 = "38af6bc0334d4d6b5ecbc88232be26fe9862e03e52c8c75e83bd39a2ddbdbcf0",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )
    jvm_maven_import_external(
        name = "com_ctre_phoenix_wpiapi_java",
        artifact = "com.ctre.phoenix:wpiapi-java:5.30.2",
        artifact_sha256 = "3cd30db480cc5cf60067ae7b91496bea48a012d9836389508a63f5b79804fa8e",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

def setup_legacy_bzlmodrio_phoenix_java_dependencies():
    __setup_bzlmodrio_phoenix_java_dependencies(None)

setup_bzlmodrio_phoenix_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix_java_dependencies,
)
