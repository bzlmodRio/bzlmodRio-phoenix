import os

from bazelrio_gentool.deps.dependency_container import ModuleDependency
from bazelrio_gentool.load_vendordep_dependency import vendordep_dependency
from get_allwpilib_dependencies import get_allwpilib_dependencies
from get_phoenix6_dependencies import get_phoenix6_dependencies


def get_phoenix_dependencies(
    use_local_allwpilib=False,
    use_local_phoenix6=False,
    use_local_opencv=False,
    use_local_ni=True,
    allwpilib_version_override="2025.1.1-beta-1",
    phoenix6_version_override="25.0.0-beta-2",
    opencv_version_override="2024.4.8.0-4.bcr1",
    ni_version_override="2025.0.0",
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
            use_local_opencv=use_local_opencv,
            use_local_ni=use_local_ni,
            opencv_version_override=opencv_version_override,
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-allwpilib",
        remote_repo="bzlmodRio-allwpilib",
        override_version=allwpilib_version_override,
    )

    phoenix6_dependency = ModuleDependency(
        get_phoenix6_dependencies(
            use_local_allwpilib=use_local_allwpilib,
            use_local_opencv=use_local_opencv,
            use_local_ni=use_local_ni,
            allwpilib_version_override=allwpilib_version_override,
            opencv_version_override=opencv_version_override,
            ni_version_override=ni_version_override,
        ),
        use_local_version=use_local_phoenix6,
        local_rel_folder="../../libraries/bzlmodRio-phoenix6",
        remote_repo="bzlmodRio-phoenix6",
        override_version=phoenix6_version_override,
    )

    group = vendordep_dependency(
        "bzlmodrio-phoenix",
        os.path.join(SCRIPT_DIR, f"vendor_dep.json"),
        fail_on_hash_miss=False,
        has_static_libraries=False,
        install_name_lookup={
            "api-cpp-sim": dict(
                deps=[
                    phoenix6_dependency.container.get_cc_dependency("tools-sim"),
                    "cci-sim",
                ],
                artifact_install_name="CTRE_PhoenixSim",
            ),
            "cci-sim": dict(
                deps=[phoenix6_dependency.container.get_cc_dependency("tools-sim")],
                artifact_install_name="CTRE_PhoenixCCISim",
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
    group.add_module_dependency(phoenix6_dependency)

    group.add_cc_meta_dependency(
        "api-cpp",
        deps=["phoenix6-hal"],
        platform_deps={
            "@rules_bzlmodrio_toolchains//constraints/is_roborio:roborio": [
                "api-cpp",
                "cci",
                "ni",
            ],
            "//conditions:default": [
                "api-cpp-sim",
                "cci-sim",
            ],
        },
        jni_deps={
            "@rules_bzlmodrio_toolchains//constraints/is_roborio:roborio": [
                "api-cpp",
                "cci",
            ],
            "//conditions:default": [
                "hal-cpp",
                "wpiutil-cpp",
                "api-cpp-sim",
                "cci-sim",
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
        deps=["phoenix6-hal", "api-cpp"],
    )

    group.add_java_meta_dependency(
        "wpiapi-java",
        group_id=f"com.ctre.phoenix",
        deps=["wpilibj-java", "api-java"],
    )

    return group
