load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_phoenix_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.31.0/api-cpp-5.31.0-headers.zip",
        sha256 = "ad8f216b4aac09efe686cb38b1775a58e48ccd4a29a1e6fe77f75d119affb266",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.31.0/api-cpp-5.31.0-windowsx86-64.zip",
        sha256 = "9e180172436053663f1457ec9a0b4a0d414e93c89057ca8efd663d7d7f686f92",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.31.0/api-cpp-5.31.0-linuxx86-64.zip",
        sha256 = "363048171289e3df30d1e58f3bbaea28d49b890ee9727ccfa851a2293d4f691c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.31.0/api-cpp-5.31.0-linuxathena.zip",
        sha256 = "1dab8ef4383d967d3f6436ce7bc48566e33f738a079fdb9a2f33e74a9473bb6f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.31.0/api-cpp-sim-5.31.0-headers.zip",
        sha256 = "638022e3f270b1f7693c4ad2ce61c5c93fbcf985e46a6750ae411c8de9f01bf4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.31.0/api-cpp-sim-5.31.0-windowsx86-64.zip",
        sha256 = "af8d0061a1283d4411f5de6ded7b69bde12327a13dba4b864eaebb94e808e398",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.31.0/api-cpp-sim-5.31.0-linuxx86-64.zip",
        sha256 = "f9456ac395cdb6492c6458514242158d6964b9c7833ab70042a98f361fefacd9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.31.0/api-cpp-sim-5.31.0-osxuniversal.zip",
        sha256 = "df4d5c52f441314342a9a9262db16b620c22fdd97f3d0cd5cea2d6ff439a273d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixSim.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_PhoenixCCISim.dylib @rpath/libCTRE_PhoenixCCISim.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimTalonFX.dylib @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.31.0/cci-5.31.0-headers.zip",
        sha256 = "43db267f4ba313aab1a0a56a8e893846c3f3b8438b11eb041b6fc921d89e8f6a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.31.0/cci-5.31.0-windowsx86-64.zip",
        sha256 = "413d32736867957ee386d9e89b1a1bcb563ed551b620186998b0802069b8ae19",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.31.0/cci-5.31.0-linuxx86-64.zip",
        sha256 = "817224dc22a1247bdc20273e81d89b19f4d3be2dfe6780bf544e8a03c6382912",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.31.0/cci-5.31.0-linuxathena.zip",
        sha256 = "e8b379264828732a9801600c67f6426ed0f3f6678929ab2e92c790fa3536d24e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.31.0/cci-sim-5.31.0-headers.zip",
        sha256 = "43db267f4ba313aab1a0a56a8e893846c3f3b8438b11eb041b6fc921d89e8f6a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.31.0/cci-sim-5.31.0-windowsx86-64.zip",
        sha256 = "2d0b4d8834a957c578a522d3571b4f8c756bc705c3109ef453fa647cd6c3c452",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.31.0/cci-sim-5.31.0-linuxx86-64.zip",
        sha256 = "2bc6cbabc80b24a6e404c2ca439b3dd79db675a74624c7a3f0d69d88e642d5db",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.31.0/cci-sim-5.31.0-osxuniversal.zip",
        sha256 = "ab73d209848a73f736b3b42866a3f70274eadabae970777cd41b7bcd404078b8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixCCISim.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimTalonFX.dylib @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/23.2.2/simCANCoder-23.2.2-headers.zip",
        sha256 = "7c698209e7ef3aa0c636537b0b7d87e559fcf5e84961bb93a9cd31b5fb93dd6c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/23.2.2/simCANCoder-23.2.2-windowsx86-64.zip",
        sha256 = "f8706dc58a40ae840d7314b5d4166b7660931869ad595733fae319f830dbcb47",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/23.2.2/simCANCoder-23.2.2-linuxx86-64.zip",
        sha256 = "61049136497cb5b967bd49734967ebf1939756eefd1a4a4aea7f65aa12d58089",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/23.2.2/simCANCoder-23.2.2-osxuniversal.zip",
        sha256 = "8f607232963a9e148017c3408ab2f804dcfdd29c3e3cb73727b5089de59330d8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/23.2.2/simPigeonIMU-23.2.2-headers.zip",
        sha256 = "7c698209e7ef3aa0c636537b0b7d87e559fcf5e84961bb93a9cd31b5fb93dd6c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/23.2.2/simPigeonIMU-23.2.2-windowsx86-64.zip",
        sha256 = "075e22a4861cd635625c69882eb6224d2cc3550ae6d5c62bcfdebc1e344778fe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/23.2.2/simPigeonIMU-23.2.2-linuxx86-64.zip",
        sha256 = "bda4ebc679d4907d97c961d263c48738fb676d8160ae5c1bde5010cd762d48b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/23.2.2/simPigeonIMU-23.2.2-osxuniversal.zip",
        sha256 = "77c5f95b31fd6125b07d5fa607267fcdef933f066cd49e79500521352656f7bc",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/23.2.2/simProCANcoder-23.2.2-headers.zip",
        sha256 = "7c698209e7ef3aa0c636537b0b7d87e559fcf5e84961bb93a9cd31b5fb93dd6c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/23.2.2/simProCANcoder-23.2.2-windowsx86-64.zip",
        sha256 = "72810252a020f12266485a635ca70cd995b0b9c417453dc88dcf6ac0211c9ace",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/23.2.2/simProCANcoder-23.2.2-linuxx86-64.zip",
        sha256 = "9e2e12bbcfba30e4a3b94f93831a544ccadfbc98e1c57d57fa23ee57ca48b395",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/23.2.2/simProCANcoder-23.2.2-osxuniversal.zip",
        sha256 = "28f98fd4270136205dcd533c90af2ab7a1f94d1af407bd048a3d0307a7262ca6",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/23.2.2/simProPigeon2-23.2.2-headers.zip",
        sha256 = "7c698209e7ef3aa0c636537b0b7d87e559fcf5e84961bb93a9cd31b5fb93dd6c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/23.2.2/simProPigeon2-23.2.2-windowsx86-64.zip",
        sha256 = "4207329e6616113956369b23e776048fd4da275965727239207909a0a82a4833",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/23.2.2/simProPigeon2-23.2.2-linuxx86-64.zip",
        sha256 = "861cd3ba4539574e37f427fcaf6ced28ee2a5ad0edd8c34f63794492fbafd757",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/23.2.2/simProPigeon2-23.2.2-osxuniversal.zip",
        sha256 = "f4379ffb736e6819a85ba7c9b21bafe0ea4965f13dc0f6be2a26627c220e8b3b",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/23.2.2/simProTalonFX-23.2.2-headers.zip",
        sha256 = "7c698209e7ef3aa0c636537b0b7d87e559fcf5e84961bb93a9cd31b5fb93dd6c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/23.2.2/simProTalonFX-23.2.2-windowsx86-64.zip",
        sha256 = "cf750eac487b153c058b7fb55e89d89b3b7949090cbf36ffa3bab5613e949d46",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/23.2.2/simProTalonFX-23.2.2-linuxx86-64.zip",
        sha256 = "83babff6bbbf3d1683f0087d0e3b3543f41120ec8a3ca5c62a9c941285cdcda6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/23.2.2/simProTalonFX-23.2.2-osxuniversal.zip",
        sha256 = "7a39cd90a3ee05a132a384adad68f30dc8f1697d97c42d2a4de8e656fb19a3c0",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/23.2.2/simTalonFX-23.2.2-headers.zip",
        sha256 = "7c698209e7ef3aa0c636537b0b7d87e559fcf5e84961bb93a9cd31b5fb93dd6c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/23.2.2/simTalonFX-23.2.2-windowsx86-64.zip",
        sha256 = "717ff7badeeb07393e6205a666a6a4992fddf11a9b7ab0f3ab029afaabee1d25",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/23.2.2/simTalonFX-23.2.2-linuxx86-64.zip",
        sha256 = "12b17f56e0fcf8e849d6700f2dbcccaf6a96d0dc29f7f9c609f775dd1de4f872",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/23.2.2/simTalonFX-23.2.2-osxuniversal.zip",
        sha256 = "36493f9f7609794097c02a3c66f23f8cfbdcbefd11b8f20c94d75bf7ad25dac3",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_SimTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/23.2.2/simTalonSRX-23.2.2-headers.zip",
        sha256 = "7c698209e7ef3aa0c636537b0b7d87e559fcf5e84961bb93a9cd31b5fb93dd6c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/23.2.2/simTalonSRX-23.2.2-windowsx86-64.zip",
        sha256 = "ff5001ac3e3b2c0232dc69d2b348f9279ef437c915260e0711393fff6cfd4979",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/23.2.2/simTalonSRX-23.2.2-linuxx86-64.zip",
        sha256 = "66e168dc791f7429470e95b8dadd06212c06f16eab86e6ed33974ef3a97576fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/23.2.2/simTalonSRX-23.2.2-osxuniversal.zip",
        sha256 = "05e6dd5d747af840ce22d61f3ebecd0654c0f4510f514d7268dad3e99516f3c5",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/23.2.2/simVictorSPX-23.2.2-headers.zip",
        sha256 = "7c698209e7ef3aa0c636537b0b7d87e559fcf5e84961bb93a9cd31b5fb93dd6c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/23.2.2/simVictorSPX-23.2.2-windowsx86-64.zip",
        sha256 = "2b3189ca946880ba84ef3e922e355c1d15ab43e20d1499a832857c941140aeb2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/23.2.2/simVictorSPX-23.2.2-linuxx86-64.zip",
        sha256 = "d280bb2d83588e87eb9593b460ba7846b398f084d12cbfa62a6a0c0b3623678f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/23.2.2/simVictorSPX-23.2.2-osxuniversal.zip",
        sha256 = "9ec90f50a6ba07b1745887b04eceba0752637042fa9b0c008484831df24e0a81",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/23.2.2/tools-23.2.2-headers.zip",
        sha256 = "33781c9db0a204e257928351c700295aec2bf6e2abb6a49ef237a95e98442a18",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/23.2.2/tools-23.2.2-windowsx86-64.zip",
        sha256 = "7a40b0dbcad56679a42bd324eb169ee1cdcf9789a873a2b2472326453c9aade2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/23.2.2/tools-23.2.2-linuxx86-64.zip",
        sha256 = "fc30cba959b4d0e7f8983a2509c057fd61d81098aff700b43fc43caa0c410cd6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/23.2.2/tools-23.2.2-linuxathena.zip",
        sha256 = "75ec607f81ab470bc7c01fda2b8ca7b71b7dc3378b370f806f8646db27600504",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/23.2.2/tools-sim-23.2.2-headers.zip",
        sha256 = "33781c9db0a204e257928351c700295aec2bf6e2abb6a49ef237a95e98442a18",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/23.2.2/tools-sim-23.2.2-windowsx86-64.zip",
        sha256 = "9588067f867377b0a4616315d7eb4ed2d2620b9f590256c08ef8135fd1d640d6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/23.2.2/tools-sim-23.2.2-linuxx86-64.zip",
        sha256 = "ba97b446e39ffec110be8804188b22b2a28308929c1b24b59ed62f4ed3b08d1d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/23.2.2/tools-sim-23.2.2-osxuniversal.zip",
        sha256 = "b8c7925fcdf90686cad58a5afdc132f3832ff432a515fd8c7382882256f55a6e",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimTalonFX.dylib @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.31.0/wpiapi-cpp-5.31.0-headers.zip",
        sha256 = "9f4a9c444481a6f716ceff194596c57027a5cd9ab685e6ca3d568e9a4fc249f9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.31.0/wpiapi-cpp-5.31.0-windowsx86-64.zip",
        sha256 = "559019bdc5e0a865a95e1804fe1d2e66d7b4801f4931b77a69fec0b2d665bc11",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.31.0/wpiapi-cpp-5.31.0-linuxx86-64.zip",
        sha256 = "a184e33d464da9af3b3e5fb4079dac9f39d99101472f40131743b9758e6ea052",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.31.0/wpiapi-cpp-5.31.0-linuxathena.zip",
        sha256 = "ecfabb6b8258bf0c6c0cdf71a04fac2b2364078bd01ce876b147d5cb18f93e1a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.31.0/wpiapi-cpp-sim-5.31.0-headers.zip",
        sha256 = "b14d9f75c174b268e0f40f35acb885617af6d4a31d257ce19fa976ac81c2e1be",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.31.0/wpiapi-cpp-sim-5.31.0-windowsx86-64.zip",
        sha256 = "1e6801fe2098446e4ca83d08c569a79dd3e095c379e12c27ba31d15e2043cf4f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.31.0/wpiapi-cpp-sim-5.31.0-linuxx86-64.zip",
        sha256 = "c42fc6bfa42c874495143a54582b9e9c442bf0218a4a569c671d8edce400584f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.31.0/wpiapi-cpp-sim-5.31.0-osxuniversal.zip",
        sha256 = "c4dc3b3e4284165ed7d523acb8b92a5040c7da84709353386218757af848d7a4",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_Phoenix_WPISim.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixCCISim.dylib @rpath/libCTRE_PhoenixCCISim.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixSim.dylib @rpath/libCTRE_PhoenixSim.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimTalonFX.dylib @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
        ],
    )

def setup_legacy_bzlmodrio_phoenix_cpp_dependencies():
    __setup_bzlmodrio_phoenix_cpp_dependencies(None)

setup_bzlmodrio_phoenix_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix_cpp_dependencies,
)
