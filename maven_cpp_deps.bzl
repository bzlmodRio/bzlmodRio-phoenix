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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.30.4/api-cpp-5.30.4-headers.zip",
        sha256 = "0f38d570949a4e8833aa6ab5a9fa0caf232344d96674d1e4ae342c63a47bdf2a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.30.4/api-cpp-5.30.4-windowsx86-64.zip",
        sha256 = "786537ff96f14e6a3a3a2a315e932b2bf016146ef2aedc5dc6a1f91da5da8c96",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.30.4/api-cpp-5.30.4-linuxx86-64.zip",
        sha256 = "b3349dfcb367f6d729ea14e16cec4af96668d959d423d7e47c19ec991c6626b6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/api-cpp/5.30.4/api-cpp-5.30.4-linuxathena.zip",
        sha256 = "1ba6c3a17a644bb7f9643faf5ba6cc6d20e43991fbfffb58c8f0d3e780f3a2bc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.30.4/api-cpp-sim-5.30.4-headers.zip",
        sha256 = "807f8a7249f3bf8ae034dfd1c7326d20babcbf5079dee4c4e6f3951cba1ef60d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.30.4/api-cpp-sim-5.30.4-windowsx86-64.zip",
        sha256 = "9283932f3373bc9b7bfc6a7b2e2c0aea91b8d6034fd3f0f471edabe8582b8bd4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.30.4/api-cpp-sim-5.30.4-linuxx86-64.zip",
        sha256 = "50be2396d89cdf2ca73534181d7b1e627931c58b3875036354887bd8f542bb41",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/api-cpp-sim/5.30.4/api-cpp-sim-5.30.4-osxuniversal.zip",
        sha256 = "11f83fdbb040e8a1122065d1dae8b718c57c7a68d2da406223d1fce2f3c31cb2",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.30.4/cci-5.30.4-headers.zip",
        sha256 = "c6be4d8472dabe57889ca14deee22487a6ae964f7e21ad4b7adfa2d524980614",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.30.4/cci-5.30.4-windowsx86-64.zip",
        sha256 = "763ff77b40904eec3a1f89bc2fd5c06d2c1f2f7dd1f22d485878223e5542b2c6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.30.4/cci-5.30.4-linuxx86-64.zip",
        sha256 = "897bbdcc6166ccf913e75314966fddc70a5d879fa0934f838142085b9a283605",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_cci_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/cci/5.30.4/cci-5.30.4-linuxathena.zip",
        sha256 = "e4f31ac2a08360f2d5061cdf4d288f95379f2286fcd6736def384723d2d69f24",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.30.4/cci-sim-5.30.4-headers.zip",
        sha256 = "c6be4d8472dabe57889ca14deee22487a6ae964f7e21ad4b7adfa2d524980614",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.30.4/cci-sim-5.30.4-windowsx86-64.zip",
        sha256 = "795e2a141ce1594356361b0e6b411b5556540b5f4e91e88a99349c085cd736b9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.30.4/cci-sim-5.30.4-linuxx86-64.zip",
        sha256 = "9a3b406933df726d8008fa165af807997bba3dbfbf42ebf33324267ae6ce92dc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_cci-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/cci-sim/5.30.4/cci-sim-5.30.4-osxuniversal.zip",
        sha256 = "806d95136e7029b67285fb4e4ee1fa9a9db6aacc984a89d56e0845f6c9b12097",
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
        "bazelrio_com_ctre_phoenixpro_sim_simcancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simCANCoder/23.0.12/simCANCoder-23.0.12-headers.zip",
        sha256 = "eaa396c41ada9a77c3959c13e30624c2f5870a2e00e4b2c8802cc105576cf7ea",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simCANCoder/23.0.12/simCANCoder-23.0.12-windowsx86-64.zip",
        sha256 = "84662edf04050ec7fc4c1a4e6012ace52f5975fa18c943adc747e6eccb604269",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simCANCoder/23.0.12/simCANCoder-23.0.12-linuxx86-64.zip",
        sha256 = "123cc58200dd037439cd2f31cc29a9be0107e4201d1b63cff52224b398e505e8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simCANCoder/23.0.12/simCANCoder-23.0.12-osxuniversal.zip",
        sha256 = "8663d371b001a8714e9eb09023d61cb4ce2ce25580fdb7dbcd37a0f50292824b",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simPigeonIMU/23.0.12/simPigeonIMU-23.0.12-headers.zip",
        sha256 = "eaa396c41ada9a77c3959c13e30624c2f5870a2e00e4b2c8802cc105576cf7ea",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simPigeonIMU/23.0.12/simPigeonIMU-23.0.12-windowsx86-64.zip",
        sha256 = "0d040765de89dd08bfd6ab573dfb49dfb27f2b41a5bbc730303dff6484e28903",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simPigeonIMU/23.0.12/simPigeonIMU-23.0.12-linuxx86-64.zip",
        sha256 = "bdec69f4c231ff3733cccc0c71d1b90e24a1c9db69c7cc7c7a7900a2c67853f4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simPigeonIMU/23.0.12/simPigeonIMU-23.0.12-osxuniversal.zip",
        sha256 = "cabe5f10b51c603615d5159851871b35df9eb976b9c6c1a45e3fee079fa48abe",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProCANcoder/23.0.12/simProCANcoder-23.0.12-headers.zip",
        sha256 = "eaa396c41ada9a77c3959c13e30624c2f5870a2e00e4b2c8802cc105576cf7ea",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProCANcoder/23.0.12/simProCANcoder-23.0.12-windowsx86-64.zip",
        sha256 = "3adb2c0d907e953c02740c93c32c88a349d5b61629ffd27daa7cc446ea8472a7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProCANcoder/23.0.12/simProCANcoder-23.0.12-linuxx86-64.zip",
        sha256 = "39b94e491393656a1c43744f722ab053ca312352cb96c8b739d77580c3be288d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProCANcoder/23.0.12/simProCANcoder-23.0.12-osxuniversal.zip",
        sha256 = "6d25eaf4cc8763d45f9885e5b7e433111aa33cd5aaff96f3fb08446a9fe68e53",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProPigeon2/23.0.12/simProPigeon2-23.0.12-headers.zip",
        sha256 = "eaa396c41ada9a77c3959c13e30624c2f5870a2e00e4b2c8802cc105576cf7ea",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProPigeon2/23.0.12/simProPigeon2-23.0.12-windowsx86-64.zip",
        sha256 = "7ab05d110cd884c48820f4517d701f2d95398218c465b29486e050bbb6bd2d78",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProPigeon2/23.0.12/simProPigeon2-23.0.12-linuxx86-64.zip",
        sha256 = "3f6b3e2b7a4cad2621c57b3571ab063b639d743363c29a3685129dde5c37af07",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProPigeon2/23.0.12/simProPigeon2-23.0.12-osxuniversal.zip",
        sha256 = "ac5aaffb9c15bda9d2ca9953ace5cb398ff2fa2741b2f8b62f7e2c628b320c85",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProTalonFX/23.0.12/simProTalonFX-23.0.12-headers.zip",
        sha256 = "eaa396c41ada9a77c3959c13e30624c2f5870a2e00e4b2c8802cc105576cf7ea",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProTalonFX/23.0.12/simProTalonFX-23.0.12-windowsx86-64.zip",
        sha256 = "f47a6d92081f6fb1788524d8403d5d9b782c46be75fa011310d39855b3ac2afd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProTalonFX/23.0.12/simProTalonFX-23.0.12-linuxx86-64.zip",
        sha256 = "e9d87f0f3e3df8119202ec22e35d2c7e41a47d53444405143ef69bcea637cb8f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simProTalonFX/23.0.12/simProTalonFX-23.0.12-osxuniversal.zip",
        sha256 = "cb0ed2352a3dce9af9be052f76b80d3abe2c9177bfb2a8c0273df51703400ba7",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simtalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simTalonFX/23.0.12/simTalonFX-23.0.12-headers.zip",
        sha256 = "eaa396c41ada9a77c3959c13e30624c2f5870a2e00e4b2c8802cc105576cf7ea",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simtalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simTalonFX/23.0.12/simTalonFX-23.0.12-windowsx86-64.zip",
        sha256 = "bf8acda19464999f80f19cbd08bdbd3c570d3ee4d7e8958ab126c9498cff539d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simtalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simTalonFX/23.0.12/simTalonFX-23.0.12-linuxx86-64.zip",
        sha256 = "a823bc51a10c92843cb979c1a15c9ebc31d97df1fdad3fa5fadabcb4635d2691",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simtalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simTalonFX/23.0.12/simTalonFX-23.0.12-osxuniversal.zip",
        sha256 = "c336662120bf359ed7cb60dc7dac41d7455a3e563c345064d08abf6ef35c3135",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_SimTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simTalonSRX/23.0.12/simTalonSRX-23.0.12-headers.zip",
        sha256 = "eaa396c41ada9a77c3959c13e30624c2f5870a2e00e4b2c8802cc105576cf7ea",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simTalonSRX/23.0.12/simTalonSRX-23.0.12-windowsx86-64.zip",
        sha256 = "c49ece8722f3101996808342dff0daff23be7ac2718321f33c4bbb91033e7663",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simTalonSRX/23.0.12/simTalonSRX-23.0.12-linuxx86-64.zip",
        sha256 = "c747f7d74a629c952cf2bde9760972a7d665f5321e709361724b6114f5bd1fb9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simTalonSRX/23.0.12/simTalonSRX-23.0.12-osxuniversal.zip",
        sha256 = "0b72c92e469093a73d680c78e36828e54f8633ae652309f9efa661935b23390e",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simVictorSPX/23.0.12/simVictorSPX-23.0.12-headers.zip",
        sha256 = "eaa396c41ada9a77c3959c13e30624c2f5870a2e00e4b2c8802cc105576cf7ea",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simVictorSPX/23.0.12/simVictorSPX-23.0.12-windowsx86-64.zip",
        sha256 = "c88cb9de418b13d4de8b2cd56163482f2e78bc23e292ed1bfe7503c5d14b9eb4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simVictorSPX/23.0.12/simVictorSPX-23.0.12-linuxx86-64.zip",
        sha256 = "1e47a22417d30a2f9931d0982845d2d767dbe81c3c0fd4ec00b72fe0b3323b9f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/simVictorSPX/23.0.12/simVictorSPX-23.0.12-osxuniversal.zip",
        sha256 = "0e0e73dc232f9e50929a8366df5d97bc8c90143fab06f4fd655d98b916c4fcc2",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/tools/23.0.12/tools-23.0.12-headers.zip",
        sha256 = "3b7da4c5b2c5f602ae6dcfed66323950e3a3bdba64af44b46215005a738814bc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/tools/23.0.12/tools-23.0.12-windowsx86-64.zip",
        sha256 = "81c560ef661143de36358fee9b70392e6d4735f288f3ddc70159e1e972a5e399",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/tools/23.0.12/tools-23.0.12-linuxx86-64.zip",
        sha256 = "9049f3f4947a7bc7197c1b242ad65d22b772bee224abe6b1be3a7b92cf1b5c7e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/tools/23.0.12/tools-23.0.12-linuxathena.zip",
        sha256 = "5855d50803d1769b9fed25ef61d7820756644ea5236d4aa8ee16b9b1ecf85cd9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/tools-sim/23.0.12/tools-sim-23.0.12-headers.zip",
        sha256 = "3b7da4c5b2c5f602ae6dcfed66323950e3a3bdba64af44b46215005a738814bc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/tools-sim/23.0.12/tools-sim-23.0.12-windowsx86-64.zip",
        sha256 = "1b43acac09de1077f103b75bba9a8830af363dedfc30e959baa522dbfc3fa3e6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/tools-sim/23.0.12/tools-sim-23.0.12-linuxx86-64.zip",
        sha256 = "539d830e159fef4fa16ccd7e5f2c120b4b8c9bec3c0d77792e0755dbe3f18c2c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenixpro_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenixpro/sim/tools-sim/23.0.12/tools-sim-23.0.12-osxuniversal.zip",
        sha256 = "76c1b8a58b7f9722a04e431c9e08cde90e52e258c38cc51d268bf83ec5bf8620",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.30.4/wpiapi-cpp-5.30.4-headers.zip",
        sha256 = "6eeb2c5018e33ce164e5284f7b9d2aa049df75f3ee99897f1761a9682d2957d9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.30.4/wpiapi-cpp-5.30.4-windowsx86-64.zip",
        sha256 = "60cca5db27b0f2f901fea9cdc1d9fe33c26ae85a9ebba8bb8924173ce78fcd89",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.30.4/wpiapi-cpp-5.30.4-linuxx86-64.zip",
        sha256 = "b0a9f73a4e4544580cbb05593eed99776a4e8997db6386deda48ed9a7d2cd987",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/wpiapi-cpp/5.30.4/wpiapi-cpp-5.30.4-linuxathena.zip",
        sha256 = "45731d11fc9aee3797e97cc1a31eed5318ac1177e4189c8eb1848228887a6b57",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.30.4/wpiapi-cpp-sim-5.30.4-headers.zip",
        sha256 = "865686b559d008e46ff520188176b7ac7c254d83cb8bc097c50bf6fee9d37182",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.30.4/wpiapi-cpp-sim-5.30.4-windowsx86-64.zip",
        sha256 = "79977f947abae9eeae057b3361b9da1ec193039b4fb77db89e809739b21ce253",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.30.4/wpiapi-cpp-sim-5.30.4-linuxx86-64.zip",
        sha256 = "4b0d8923ff13c7fb035f52fe2c6db034ecd4432c90fbedfa5acb7ef7e1390d54",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix/sim/wpiapi-cpp-sim/5.30.4/wpiapi-cpp-sim-5.30.4-osxuniversal.zip",
        sha256 = "14e6a17c1282d92cea1045b84a2a645df3fcae89a9ddc321c0efaa713933e991",
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
