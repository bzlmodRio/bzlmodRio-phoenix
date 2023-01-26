load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix_api_java",
        artifact = "com.ctre.phoenix:api-java:5.21.2",
        artifact_sha256 = "518ce0937acef5df61ba7716c1137f9452d254565d5436658544b153dde02520",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )
    jvm_maven_import_external(
        name = "com_ctre_phoenix_wpiapi_java",
        artifact = "com.ctre.phoenix:wpiapi-java:5.21.2",
        artifact_sha256 = "68d73f235ffa7c20febabcaac7f1e00df76b698876b0e2616ab060ae86e4678d",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

def setup_legacy_bzlmodrio_phoenix_java_dependencies():
    __setup_bzlmodrio_phoenix_java_dependencies(None)

setup_bzlmodrio_phoenix_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix_java_dependencies,
)
