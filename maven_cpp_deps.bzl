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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-2/api-cpp-5.34.0-beta-2-headers.zip",
        sha256 = "07c69491ced5a59c0931d553ad2147b6caa533ce6325483ff93a51359885166c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-2/api-cpp-5.34.0-beta-2-windowsx86-64.zip",
        sha256 = "35b8e71254b377bb964fea20c696b3471e66cae6645ba1f47f572670368b7b0f",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-2/api-cpp-5.34.0-beta-2-linuxx86-64.zip",
        sha256 = "609258e601682d20c5ff1720a605a855e00767e0513ccfd5a15269b61bca8f46",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-2/api-cpp-5.34.0-beta-2-linuxathena.zip",
        sha256 = "cf3549c2d751f1bbc6043db250abee925b0e37aeaabc0ac9d441c1245735fd4c",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-2/api-cpp-sim-5.34.0-beta-2-headers.zip",
        sha256 = "76a3464bcff7acd3a8c6f7dd8557c33c6ddb5e057552a38495a65262a684f5e1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-2/api-cpp-sim-5.34.0-beta-2-windowsx86-64.zip",
        sha256 = "a35c9f7519e9defbca1f98be8cf1754fd3964eb402c6e486d4221d3968823d61",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-2/api-cpp-sim-5.34.0-beta-2-linuxx86-64.zip",
        sha256 = "693590ade5c6d1d16b28271163ec982afaee64c9bf90bf39768ffba9f82098b6",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-2/api-cpp-sim-5.34.0-beta-2-osxuniversal.zip",
        sha256 = "69ad007d4495ac23ea098c26205ca1546837ffa10b57e42bb5221e577b220a44",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-2/cci-5.34.0-beta-2-headers.zip",
        sha256 = "5104bf04b323d645921b62e1e5855176b639255252c69c5036e613da14b1edb6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-2/cci-5.34.0-beta-2-windowsx86-64.zip",
        sha256 = "9ebf58f47526de49894a8d9ecafedb64accf273576ce2fb1ee26d40f548ec74b",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-2/cci-5.34.0-beta-2-linuxx86-64.zip",
        sha256 = "52e9eec2e1caf492557b45d88aec1f6b4cc500c219649a87ee085b6c846edb62",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-2/cci-5.34.0-beta-2-linuxathena.zip",
        sha256 = "8765b38909341366429476eacfe9ebce13ac636b518f609f44c3df355f12d096",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-2/cci-sim-5.34.0-beta-2-headers.zip",
        sha256 = "5104bf04b323d645921b62e1e5855176b639255252c69c5036e613da14b1edb6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-2/cci-sim-5.34.0-beta-2-windowsx86-64.zip",
        sha256 = "d658c234fbb265e97353035d366bdaef9754c6505f453d636018209d8a0f36ab",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-2/cci-sim-5.34.0-beta-2-linuxx86-64.zip",
        sha256 = "3199b6c2263e2053d845ddafbf2fb2994942072e92e507ea781b7d4ff2282efb",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-2/cci-sim-5.34.0-beta-2-osxuniversal.zip",
        sha256 = "7bc59c320d26e3ed70aa8446ab2a2abb087b033147c334fe36ab600246d9e785",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-2/wpiapi-cpp-5.34.0-beta-2-headers.zip",
        sha256 = "aa4c14b474b69ddff6575be1da0c7c235e044414b37c4dc4a245d71165e69e43",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-2/wpiapi-cpp-5.34.0-beta-2-windowsx86-64.zip",
        sha256 = "396b22d0e03804169caa1ea1a5c6e260b92fb943aecf8ea0b0853312e2318f74",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-2/wpiapi-cpp-5.34.0-beta-2-linuxx86-64.zip",
        sha256 = "c543354e423085227f7003737d648ee41fdbc448a9a4631bfca60eadbf4994b8",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-2/wpiapi-cpp-5.34.0-beta-2-linuxathena.zip",
        sha256 = "5b6e621e2db80e3ffc37f47791ba50bacc285a54b23840a7999a5ec923ec582c",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-2/wpiapi-cpp-sim-5.34.0-beta-2-headers.zip",
        sha256 = "47024de83ba800b6aaf2e7dcc662e309151999852699f697ca28ff6d7201100d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-2/wpiapi-cpp-sim-5.34.0-beta-2-windowsx86-64.zip",
        sha256 = "97be6c99d9dadfb3c9d7e4ebbf6149be5ee070c31bdb92b95903bc096745cef3",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-2/wpiapi-cpp-sim-5.34.0-beta-2-linuxx86-64.zip",
        sha256 = "31a0cac95d11fbc28adf305a7ac42cf585a72f9cfd8dc3ffedc4f463670eaf11",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-2/wpiapi-cpp-sim-5.34.0-beta-2-osxuniversal.zip",
        sha256 = "7f059c0a36cbe0ec9866d6ff7b4241aee481dfae2cb4c7dabfb45d78bbe8749b",
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
