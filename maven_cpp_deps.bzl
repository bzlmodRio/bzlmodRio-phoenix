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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-3/api-cpp-5.34.0-beta-3-headers.zip",
        sha256 = "eef9cf6e4f02bf11a73b8e46ed411e9c682c08d964738db3675afd2be8ba4bf9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-3/api-cpp-5.34.0-beta-3-windowsx86-64.zip",
        sha256 = "97de6f62cbdbdb693b1e0152ca14bb54c0a59270ed14e68fc2b05156562e968d",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-3/api-cpp-5.34.0-beta-3-linuxx86-64.zip",
        sha256 = "a5987c0eca5943a950a0bb16e7c2ddb9b2cea32d9b84f919c7f4f1cec0f3049b",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-3/api-cpp-5.34.0-beta-3-linuxarm64.zip",
        sha256 = "77b5e8efad068f74cebc981aaa3f624042b8bb5e79f44b2fc8d379cee1172874",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-3/api-cpp-5.34.0-beta-3-linuxathena.zip",
        sha256 = "9837f464b29f5f0140a6d77d5b17ca3fb9a279500f41edb4a1d740f22444e6f4",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-3/api-cpp-sim-5.34.0-beta-3-headers.zip",
        sha256 = "900d1c719a010f26c642a8252902ee83358786fcb9356e1635b67ec2b36cfc99",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-3/api-cpp-sim-5.34.0-beta-3-windowsx86-64.zip",
        sha256 = "13d69f41d8faffa837c0605e98965a3a1a207810deaa864d07d3b13fb9424bdc",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-3/api-cpp-sim-5.34.0-beta-3-linuxx86-64.zip",
        sha256 = "5bf1eedb71326e5ce64ca2b52a94b54eb97f166800390cbea7b51a162c043285",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-3/api-cpp-sim-5.34.0-beta-3-linuxarm64.zip",
        sha256 = "b3f88e40cb1ad332263f5679073497a02cce80891021b5c34bad7eb1b84458d4",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-3/api-cpp-sim-5.34.0-beta-3-osxuniversal.zip",
        sha256 = "1ba1aca36e122653727926d4a9cc8d676157c2a4217703403926e1f5c0e3c8ad",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-3/cci-5.34.0-beta-3-headers.zip",
        sha256 = "420ce50339179dfd061d85622c38c66bb18d103c5f9d0c9e7041d79fcd310412",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-3/cci-5.34.0-beta-3-windowsx86-64.zip",
        sha256 = "2464882190cb3352396b5b6a64ff381de9b6c3efc8e1445a5725cddca2fda646",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-3/cci-5.34.0-beta-3-linuxx86-64.zip",
        sha256 = "539e31180ebb41d249652c275c2a336efad5ef00cd682804742c65c32dd52d80",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-3/cci-5.34.0-beta-3-linuxarm64.zip",
        sha256 = "dbb563f6d1e6637990abff28c3053b34817866f091b7e49c7c228e66685456ee",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-3/cci-5.34.0-beta-3-linuxathena.zip",
        sha256 = "f9846c046a772282c97e2f222a172a59de04cd8d100227fb9c5c96445e6dd345",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-3/cci-sim-5.34.0-beta-3-headers.zip",
        sha256 = "420ce50339179dfd061d85622c38c66bb18d103c5f9d0c9e7041d79fcd310412",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-3/cci-sim-5.34.0-beta-3-windowsx86-64.zip",
        sha256 = "fb290598e1579975f25f8ae5e183f610f0d27a514b86fcd23724110793cba3ed",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-3/cci-sim-5.34.0-beta-3-linuxx86-64.zip",
        sha256 = "3bf41e16cecf68f78178651121c83fe80a93e4e152a885ff69d6b957f82f249a",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-3/cci-sim-5.34.0-beta-3-linuxarm64.zip",
        sha256 = "7e5278216ab4e69c729850a0221a73265924c00e0b455ca27b87cb86c30d3afc",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-3/cci-sim-5.34.0-beta-3-osxuniversal.zip",
        sha256 = "b048cd208b6963df72364e8f78274c43a054fc2608eae015803ea6ba50bb7d37",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-3/wpiapi-cpp-5.34.0-beta-3-headers.zip",
        sha256 = "38ac66df4260934af3d846365447e759554a50f0d0d3e41e8d6738a96f3017ac",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-3/wpiapi-cpp-5.34.0-beta-3-windowsx86-64.zip",
        sha256 = "1663d3d3b7444b7a0394c186f1cdff3e77848de049d0834d978f2dd6cce6d7c1",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-3/wpiapi-cpp-5.34.0-beta-3-linuxx86-64.zip",
        sha256 = "c43880fc204fd2bec1f59cdd237ecf8719266bc09e5fa6dc6df60fbb1f2a1471",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-3/wpiapi-cpp-5.34.0-beta-3-linuxarm64.zip",
        sha256 = "db204b061e7e23b93a19727711de36632c9e03b1255025d2fc58f23e169d2781",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-3/wpiapi-cpp-5.34.0-beta-3-linuxathena.zip",
        sha256 = "f319bfe7fc8d1d0ab9ae5ddccad78b9b0a7ad7cadfcac92e5936400fde2be58d",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-3/wpiapi-cpp-sim-5.34.0-beta-3-headers.zip",
        sha256 = "a09df7c8859f1a15133b3f63a58a62efdd2117333719ab460404112a243b793d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-3/wpiapi-cpp-sim-5.34.0-beta-3-windowsx86-64.zip",
        sha256 = "42ef482fb5fbab2e1b51222b5aacbbc088d04370d8830e516be632b6a523d9f1",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-3/wpiapi-cpp-sim-5.34.0-beta-3-linuxx86-64.zip",
        sha256 = "54bf77d24b26a64d1053650c6f4340f697a7d9d9be844fcbc161fb93a2dcc1f6",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-3/wpiapi-cpp-sim-5.34.0-beta-3-linuxarm64.zip",
        sha256 = "d0157f7f40c71b307387c731e2d91e4443a22a00222615647b2c66efee146b09",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-3/wpiapi-cpp-sim-5.34.0-beta-3-osxuniversal.zip",
        sha256 = "1b368ab8636fc3164139db0c29c1232db86da48389c9848e9527f2bf7e91bf2e",
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
