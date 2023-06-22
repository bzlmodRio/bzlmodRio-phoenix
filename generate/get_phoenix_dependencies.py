import os

from bazelrio_gentool.load_vendordep_dependency import vendordep_dependency
from get_allwpilib_dependencies import get_allwpilib_dependencies
from bazelrio_gentool.deps.dependency_container import (
    ModuleDependency,
)


def get_phoenix_dependencies(
    use_local_allwpilib=False, use_local_opencv=False, use_local_ni=True,
    allwpilib_version_override = "2023.3.2",
    opencv_version_override = "4.6.0-4"
):
    sim_install_name_classes = [
        "simCANCoder",
        "simPigeonIMU",
        "simProPigeon2",
        "simProCANcoder",
        "simProTalonFX",
        "simTalonFX",
        "simTalonSRX",
        "simVictorSPX",
    ]

    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

    allwpilib_dependency = ModuleDependency(
        get_allwpilib_dependencies(
            use_local_opencv=use_local_opencv, use_local_ni=use_local_ni,
            opencv_version_override = opencv_version_override,
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-allwpilib",
        remote_repo="bzlmodRio-allwpilib",
        override_version = "2023.3.2"
    )

    group = vendordep_dependency(
        "bzlmodrio-phoenix",
        os.path.join(SCRIPT_DIR, f"vendor_dep.json"),
        year=2023,
        fail_on_hash_miss=False,
        has_static_libraries=False,
        install_name_lookup={
            "simCANCoder": dict(deps=[], artifact_install_name="CTRE_SimCANCoder"),
            "simPigeonIMU": dict(deps=[], artifact_install_name="CTRE_SimPigeonIMU"),
            "simProPigeon2": dict(deps=[], artifact_install_name="CTRE_SimProPigeon2"),
            "simProCANcoder": dict(
                deps=[], artifact_install_name="CTRE_SimProCANcoder"
            ),
            "simProTalonFX": dict(deps=[], artifact_install_name="CTRE_SimProTalonFX"),
            "simTalonFX": dict(deps=[], artifact_install_name="CTRE_SimTalonFX"),
            "simTalonSRX": dict(deps=[], artifact_install_name="CTRE_SimTalonSRX"),
            "simVictorSPX": dict(deps=[], artifact_install_name="CTRE_SimVictorSPX"),
            "api-cpp-sim": dict(
                deps=["tools-sim", "cci-sim"], artifact_install_name="CTRE_PhoenixSim"
            ),
            "cci-sim": dict(
                deps=["tools-sim"], artifact_install_name="CTRE_PhoenixCCISim"
            ),
            "tools-sim": dict(
                deps=sim_install_name_classes,
                artifact_install_name="CTRE_PhoenixTools_Sim",
            ),
            "wpiapi-cpp-sim": dict(
                deps=[
                    "api-cpp-sim",
                    allwpilib_dependency.container.get_cc_dependency("wpilibc-cpp"),
                ],
                artifact_install_name="CTRE_Phoenix_WPISim",
            ),
        },
    )
    group.add_module_dependency(allwpilib_dependency)

    group.add_cc_meta_dependency(
        "api-cpp",
        deps=[],
        platform_deps={
            "@rules_bzlmodrio_toolchains//constraints/is_roborio:roborio": [
                "api-cpp",
                "cci",
                "tools",
                "ni",
            ],
            "//conditions:default": [
                "hal-cpp",
                "api-cpp-sim",
                "cci-sim",
                "tools-sim",
                "simCANCoder",
                "simPigeonIMU",
                "simProCANcoder",
                "simProPigeon2",
                "simProTalonFX",
                "simTalonFX",
                "simTalonSRX",
                "simVictorSPX",
            ],
        },
        jni_deps={
            "@rules_bzlmodrio_toolchains//constraints/is_roborio:roborio": [
                "api-cpp",
                "cci",
                "tools",
            ],
            "//conditions:default": [
                "hal-cpp",
                "wpiutil-cpp",
                "api-cpp-sim",
                "cci-sim",
                "tools-sim",
                "simCANCoder",
                "simPigeonIMU",
                "simProCANcoder",
                "simProPigeon2",
                "simProTalonFX",
                "simTalonFX",
                "simTalonSRX",
                "simVictorSPX",
            ],
        },
    )

    group.add_cc_meta_dependency(
        "wpiapi-cpp",
        deps=["wpilibc-cpp", "api-cpp"],
        platform_deps={
            "@rules_bzlmodrio_toolchains//constraints/is_roborio:roborio": [
                "wpiapi-cpp",
            ],
            "//conditions:default": [
                "wpiapi-cpp-sim",
            ],
        },
    )

    group.add_java_meta_dependency(
        "api-java",
        group_id=f"com.ctre.phoenix",
        deps=["api-cpp"],
    )

    group.add_java_meta_dependency(
        "wpiapi-java",
        group_id=f"com.ctre.phoenix",
        deps=["wpilibj-java", "api-java"],
    )

    return group
