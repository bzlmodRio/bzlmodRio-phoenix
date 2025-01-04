load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "header_files",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

def __setup_bzlmodrio_phoenix_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.35.0/api-cpp-5.35.0-headers.zip",
        sha256 = "5abb072f9e5b6b3bcc86ddbfed4ecf4108d9ea85a6b91921633d45a88b4a0b0b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.35.0/api-cpp-5.35.0-windowsx86-64.zip",
        sha256 = "14b9cb33c72e71150d9fffebbb8b4fa48be4475761702e4b3ae0fffe2ea2d845",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.35.0/api-cpp-5.35.0-linuxx86-64.zip",
        sha256 = "c5b212cfe1686916f63c375ba22ba19c66078fe9891c9bafc49a033ed9f14052",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.35.0/api-cpp-5.35.0-linuxarm64.zip",
        sha256 = "213f2143243bd1a3e7f01023425518d031431c98e418796060a8999fa697bf01",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.35.0/api-cpp-5.35.0-linuxathena.zip",
        sha256 = "b16d089f4f71804bbdb5245952de307b75410f2814392b6832f751177057c936",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.35.0/api-cpp-sim-5.35.0-headers.zip",
        sha256 = "558714afb2d15a42beea5375b561b2d214948c856c5e223c4234cce216d45fb8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.35.0/api-cpp-sim-5.35.0-windowsx86-64.zip",
        sha256 = "52017dec048760b7a2664dd1119adf64349034240e2436672d4f08973a2e758c",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.35.0/api-cpp-sim-5.35.0-linuxx86-64.zip",
        sha256 = "f349a50498fa69b40e5a3bd9ac046e679140a70b30ae7280d3a9b8aaa5e8aafb",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.35.0/api-cpp-sim-5.35.0-linuxarm64.zip",
        sha256 = "deda0ded31b121a9f3792d52378668397d054ae0f326e20715f2f05a6abfad5c",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.35.0/api-cpp-sim-5.35.0-osxuniversal.zip",
        sha256 = "6fd678456ebf0a91f7ee5c38abf596713cb3ba3b1f0535e181d98d81badbc7c6",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixSim.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_PhoenixCCISim.dylib @rpath/libCTRE_PhoenixCCISim.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.35.0/cci-5.35.0-headers.zip",
        sha256 = "352fb8b0a73e18f0a00aa3c04880545c14a2bd09009031798a4f9a854ee71ff3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.35.0/cci-5.35.0-windowsx86-64.zip",
        sha256 = "040c4d6b2fca2137d84d3fbbbbfc9882e57893a836db289451fda5726bce1ccb",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.35.0/cci-5.35.0-linuxx86-64.zip",
        sha256 = "51cdb05465206dfd4015982e2b4e7bc96c5aabfb69874f4073ec6938648a61cc",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.35.0/cci-5.35.0-linuxarm64.zip",
        sha256 = "b41a46a5edd2c1db4dab5b61f15ff0657220283526d69455575deeaf2e6b376d",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.35.0/cci-5.35.0-linuxathena.zip",
        sha256 = "cc8b1c4fb62368779cff97ef03ed6faf3612e7b327ba08a73849d789ea3a3b3c",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.35.0/cci-sim-5.35.0-headers.zip",
        sha256 = "352fb8b0a73e18f0a00aa3c04880545c14a2bd09009031798a4f9a854ee71ff3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.35.0/cci-sim-5.35.0-windowsx86-64.zip",
        sha256 = "518dfed13716c2bb7d045b4715c26e8cb2b8988aa0d7f388d71d2677f58cb3ec",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.35.0/cci-sim-5.35.0-linuxx86-64.zip",
        sha256 = "94593a0fcc3cda78fb742e3482063158ee26d4533eadc8dab829b7451cfbec65",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.35.0/cci-sim-5.35.0-linuxarm64.zip",
        sha256 = "fe2e721a49b33b3e22488c6beb5bacc36d3a798bc3a6018f519060ebf706c4c4",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.35.0/cci-sim-5.35.0-osxuniversal.zip",
        sha256 = "5b770dd8a8acd1a5368d70563d6a9f1d797bae39a6b87de4c6ec026f9f3587d1",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixCCISim.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.35.0/wpiapi-cpp-5.35.0-headers.zip",
        sha256 = "a3a69a90da22e86a618ea3e4bfba224103f721385b6a6f766ea5f51e3bd0609c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.35.0/wpiapi-cpp-5.35.0-windowsx86-64.zip",
        sha256 = "18865e21de23453f7e02b57e6256b8edb5a75480751f6e18f3c71eb8b1ef2c0d",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.35.0/wpiapi-cpp-5.35.0-linuxx86-64.zip",
        sha256 = "b739acfe97bdf41e42b4bfdf1e38ec0dba7293af7796318cfff2cfb21841d638",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.35.0/wpiapi-cpp-5.35.0-linuxarm64.zip",
        sha256 = "929f03ba401fc90a6e8595ce3d500e02854ff40ebf867bc65e07cec3ae44dd0b",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.35.0/wpiapi-cpp-5.35.0-linuxathena.zip",
        sha256 = "50ac63cf388cbe4393785ff4adc066579fb824a4826b5766044bc27b6a27c712",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.35.0/wpiapi-cpp-sim-5.35.0-headers.zip",
        sha256 = "049ad1111d6287528fffbba1278d8ff5b6e0cebb11d2d676eaf8c60689a8c525",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.35.0/wpiapi-cpp-sim-5.35.0-windowsx86-64.zip",
        sha256 = "79783a09c5794f0967621783511ae996fd6932dd7d416f06167b561a2bb5d3ce",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.35.0/wpiapi-cpp-sim-5.35.0-linuxx86-64.zip",
        sha256 = "a22538d65695294834e1a18e3ae20a48dcec9a1a4a628dfce985281543d126a3",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.35.0/wpiapi-cpp-sim-5.35.0-linuxarm64.zip",
        sha256 = "7202bdc4c7d8fb1d49d998ae216cb56e85431c8510b22ee667828509d222b5b8",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.35.0/wpiapi-cpp-sim-5.35.0-osxuniversal.zip",
        sha256 = "0c1137676d8001fb14c1ebec009223b261b2b348bf90498b145c554f54975f17",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
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
