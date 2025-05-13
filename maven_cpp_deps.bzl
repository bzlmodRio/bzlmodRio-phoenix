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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.35.1/api-cpp-5.35.1-headers.zip",
        sha256 = "e108a859ccf5fab961bc27d6e8b1c3e4cd0749112a203ec143b00d8f3064250c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.35.1/api-cpp-5.35.1-windowsx86-64.zip",
        sha256 = "5a4eec48ee04bfb830ec64b3e760d6ad2c34e9d8e3eb776f500a67596e294086",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.35.1/api-cpp-5.35.1-linuxx86-64.zip",
        sha256 = "976a202648727d6c35244617467a1889c6830ec5005c4b3c531f4dae97eb8003",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.35.1/api-cpp-5.35.1-linuxarm64.zip",
        sha256 = "66775af3db13349719883b0cd525f632670cd31774dce0e0dfa8841454ba3322",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.35.1/api-cpp-5.35.1-linuxathena.zip",
        sha256 = "9aecb93fe9f5fdfab4b0b2582c86f5330ccabe09681d4d76b0a86e92dc2c08a6",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.35.1/api-cpp-sim-5.35.1-headers.zip",
        sha256 = "d5e0d6bd8ca4734db22d5610d1de8c69142487c4774c19edeaa3ee07f22fe53f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.35.1/api-cpp-sim-5.35.1-windowsx86-64.zip",
        sha256 = "8e44812a1562712cd3516fae084a66705862bfa423ff855a34f2cf877dd39031",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.35.1/api-cpp-sim-5.35.1-linuxx86-64.zip",
        sha256 = "93df8c49aedf1d419b00c644772cc0975678a85fc5e5e96588d1a0160198181a",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.35.1/api-cpp-sim-5.35.1-linuxarm64.zip",
        sha256 = "0d076a86cd58da303c8da3eb6dc50ed010ea5ac1f7299a41e9fcc08df3ae9473",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.35.1/api-cpp-sim-5.35.1-osxuniversal.zip",
        sha256 = "ba2f7ac72f607e5293625270ae5520440dc92873006e8e6807883218b2f15b01",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixSim.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_PhoenixCCISim.dylib @rpath/libCTRE_PhoenixCCISim.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProCANdi.dylib @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProCANdle.dylib @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixSim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.35.1/cci-5.35.1-headers.zip",
        sha256 = "29f2eea37323b172d366f639684da1903403478341343bc6f195c9401c2871bf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.35.1/cci-5.35.1-windowsx86-64.zip",
        sha256 = "799b2cea1e43598f699facfe1f045d8121514d2cce0e59c22082eccae4880de3",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.35.1/cci-5.35.1-linuxx86-64.zip",
        sha256 = "b4f7c1eb7536ecbb04564202b47a225532976fd934423726e5ef11ac84bb4d4e",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.35.1/cci-5.35.1-linuxarm64.zip",
        sha256 = "3284a09eb39106879584633b12d105052c8e80df7ff84e3d715131fe00786970",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.35.1/cci-5.35.1-linuxathena.zip",
        sha256 = "5269bdb00f3a14bf019705919aa305e516c009ca1e8fe467ffd8212b2eb55d9d",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.35.1/cci-sim-5.35.1-headers.zip",
        sha256 = "29f2eea37323b172d366f639684da1903403478341343bc6f195c9401c2871bf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.35.1/cci-sim-5.35.1-windowsx86-64.zip",
        sha256 = "a76f2638cb23f3e0eb43fe94459ae927391513e17ee0238926765bd22c2c2b85",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.35.1/cci-sim-5.35.1-linuxx86-64.zip",
        sha256 = "2315bbd90834abb74d1c7d64eef8db72a9fa2ad6b2f8c488d42c899420d10c88",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.35.1/cci-sim-5.35.1-linuxarm64.zip",
        sha256 = "c8b8f1d3adfe3dfafcfc40ec2cab97db8fa38d061ba32d0dc60f2ee19d03fdc2",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.35.1/cci-sim-5.35.1-osxuniversal.zip",
        sha256 = "77b5f97361660494cdd8c1985f8038b01adf8637ebf398958da7150dc1bc8845",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixCCISim.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProCANdi.dylib @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProCANdle.dylib @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixCCISim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.35.1/wpiapi-cpp-5.35.1-headers.zip",
        sha256 = "715548dbf6fb2abb64f25ed3550d4e4c81802ab7712970463f4b1353c0e6aba1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.35.1/wpiapi-cpp-5.35.1-windowsx86-64.zip",
        sha256 = "a7472bf76c4926e9d275d2e24b97e2ef9b416e4ba30c8bba0008f4558a1b48ab",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.35.1/wpiapi-cpp-5.35.1-linuxx86-64.zip",
        sha256 = "f3cb36b420b2577f6d9bf271a876e910a9e2584c83f93cf21f9e046634c0ab21",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.35.1/wpiapi-cpp-5.35.1-linuxarm64.zip",
        sha256 = "6e426d7ddf6701565e63dc8d1e0ec19e059df85e0d612f670680eeac1a613af2",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.35.1/wpiapi-cpp-5.35.1-linuxathena.zip",
        sha256 = "9ddd00dd186ca680e5749631d69f1f5fed98e51d0dac34431edc00f80750ddae",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.35.1/wpiapi-cpp-sim-5.35.1-headers.zip",
        sha256 = "6f12ff7ec895b6257c0bf9a555a87276516765eea6f3548e8960ab92d7c37210",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.35.1/wpiapi-cpp-sim-5.35.1-windowsx86-64.zip",
        sha256 = "be44790a6bd3ad6aed81dffbb6ef02964ce87676a8268b31934993b3817a85fb",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.35.1/wpiapi-cpp-sim-5.35.1-linuxx86-64.zip",
        sha256 = "bbc53f38f182fbf0f36f4c258140b940f8c58824401c7a4d7943a2eddd553899",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.35.1/wpiapi-cpp-sim-5.35.1-linuxarm64.zip",
        sha256 = "e1c8d7ef7b6c77773cea38686db14d9f07c5826cd808428ca04329e40cfb0e14",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.35.1/wpiapi-cpp-sim-5.35.1-osxuniversal.zip",
        sha256 = "80e9f43be979be1c0622e84fa9ec24ca23ef47460cb3df56fb7cfa11227230d9",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_Phoenix_WPISim.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixCCISim.dylib @rpath/libCTRE_PhoenixCCISim.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixSim.dylib @rpath/libCTRE_PhoenixSim.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANdi.dylib @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANdle.dylib @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_Phoenix_WPISim.dylib",
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
