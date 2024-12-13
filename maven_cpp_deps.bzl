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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-4/api-cpp-5.34.0-beta-4-headers.zip",
        sha256 = "39c239816a56d4b00a620a55e4a34ee61a4d87c6fb2558b53b99bdec96f02d70",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-4/api-cpp-5.34.0-beta-4-windowsx86-64.zip",
        sha256 = "46e98a835b5d1f656341db701adc2a605530dca7d17ffa27450ff0d302f0c83b",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-4/api-cpp-5.34.0-beta-4-linuxx86-64.zip",
        sha256 = "9b07bfa3e0607754f09dd42081513e34c0e85233d4d2e56d8a7b0a78a9dccdc7",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-4/api-cpp-5.34.0-beta-4-linuxarm64.zip",
        sha256 = "116f7f674eddd32c1bc3ddda6c64eaa112a959ed4e99f300c504eccea92ee784",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.34.0-beta-4/api-cpp-5.34.0-beta-4-linuxathena.zip",
        sha256 = "4c5b55021ffeb2bbfece178425852439def061445f34ec9a53c2ff14e129e585",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-4/api-cpp-sim-5.34.0-beta-4-headers.zip",
        sha256 = "4eb48ac34e1836a22d01ec3bcfc44882e717b1500327480d9bebacd9404afdc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-4/api-cpp-sim-5.34.0-beta-4-windowsx86-64.zip",
        sha256 = "0441fdb3333277b59687d5f8fc5d6540442d6009373f25010868cfd68f35db28",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-4/api-cpp-sim-5.34.0-beta-4-linuxx86-64.zip",
        sha256 = "21393d263dfdebdd8dcec4d228e259849e196483895d187920580bb93df94b1f",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-4/api-cpp-sim-5.34.0-beta-4-linuxarm64.zip",
        sha256 = "a4a8a6fd3c9c4d9261afff48a2887555f066510dada0525d38f2bafc173e5c4e",
        build_file = "@bzlmodrio-phoenix//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.34.0-beta-4/api-cpp-sim-5.34.0-beta-4-osxuniversal.zip",
        sha256 = "553ed1a042961e3a06f16dfb1cd21204dfea73adfb00bd57aabca69eb4b96523",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-4/cci-5.34.0-beta-4-headers.zip",
        sha256 = "a9d12cb0efe64bb8a13613e3ed67987c7779866c986a4c0dac0544ff409f5930",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-4/cci-5.34.0-beta-4-windowsx86-64.zip",
        sha256 = "c22423b8b9e9e69ca3cca7e5bc64546d09707ab3321f7be984420666b4c5aa92",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-4/cci-5.34.0-beta-4-linuxx86-64.zip",
        sha256 = "d51af8ef48491e9fd0a46b61509b2358ed5d35f1e91f883952cfdabe6c357e0a",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-4/cci-5.34.0-beta-4-linuxarm64.zip",
        sha256 = "eb1550ac1f8fe00af9f1b92527c3949e1f3a6c3856663bba38431579e551582d",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.34.0-beta-4/cci-5.34.0-beta-4-linuxathena.zip",
        sha256 = "a9e17cf4e86d4b9b823f61ecbab00a46a8b5f11d798cfabc8caa6842956ddc92",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-4/cci-sim-5.34.0-beta-4-headers.zip",
        sha256 = "a9d12cb0efe64bb8a13613e3ed67987c7779866c986a4c0dac0544ff409f5930",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-4/cci-sim-5.34.0-beta-4-windowsx86-64.zip",
        sha256 = "468beeb5112e2b08176ac604b48c832934d71c716fd63724b94d6af3b218ad51",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-4/cci-sim-5.34.0-beta-4-linuxx86-64.zip",
        sha256 = "a111e8c6b2c2a212d21dcfea63b1af3ee5026bbd60bc07e91291ade396be3947",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-4/cci-sim-5.34.0-beta-4-linuxarm64.zip",
        sha256 = "6fb85a9db9b12d77120088449d2ff51fd53a6f88bd91ed92c7ec0ebfb35a121d",
        build_file = "@bzlmodrio-phoenix//private/cpp/cci-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.34.0-beta-4/cci-sim-5.34.0-beta-4-osxuniversal.zip",
        sha256 = "026862285d7ce48bce7ba6ecfcf83acc1b56fa5ae284ae3b48ff864b73c760bc",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-4/wpiapi-cpp-5.34.0-beta-4-headers.zip",
        sha256 = "b9cfe9af2abff5896ddc5ed1088f7e186c17597c5d683c918df6696dacbfa434",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-4/wpiapi-cpp-5.34.0-beta-4-windowsx86-64.zip",
        sha256 = "7be8df9d2acd409dea5482704773a269b5afc4c7d5dc557ad783684fae61fcab",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-4/wpiapi-cpp-5.34.0-beta-4-linuxx86-64.zip",
        sha256 = "a79c5bea352b0ba2f7752e3b451ae86ead98d7371b34526b1b1fced322f07068",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-4/wpiapi-cpp-5.34.0-beta-4-linuxarm64.zip",
        sha256 = "5ea84490824a21953738d6e9cc43bd78429c14b721aed55274d69c9660bc7d18",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.34.0-beta-4/wpiapi-cpp-5.34.0-beta-4-linuxathena.zip",
        sha256 = "6cfa98d790af9a7f2dcc55e143bb7be3775997156c6cbcace7e89cbd49da1669",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-4/wpiapi-cpp-sim-5.34.0-beta-4-headers.zip",
        sha256 = "15fbb7625d5af4892c331aeb9398eeec71e87a344568173786e92eecd4340afd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-4/wpiapi-cpp-sim-5.34.0-beta-4-windowsx86-64.zip",
        sha256 = "5dfff677e2972fc4ce0f13f495cc57d5146f899b4d124d470ac4305e8e63bcfe",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-4/wpiapi-cpp-sim-5.34.0-beta-4-linuxx86-64.zip",
        sha256 = "426a46bb174818dce8e8629de3ecd9b40eed71979972f888b19c1171a6279a3c",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-4/wpiapi-cpp-sim-5.34.0-beta-4-linuxarm64.zip",
        sha256 = "abe400ab46073bfcd6a6acd90a42f9ef5167c3f59e6573d0fde83b1393db15fc",
        build_file = "@bzlmodrio-phoenix//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.34.0-beta-4/wpiapi-cpp-sim-5.34.0-beta-4-osxuniversal.zip",
        sha256 = "06261fe680898200dad4262d785213271409b370af695b3a57466d807f155db5",
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
