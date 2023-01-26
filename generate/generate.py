import sys
import os

from get_ctre_dependencies import get_ctre_dependencies
from bazelrio_gentool.generate_group import generate_meta_deps
from bazelrio_gentool.generate_module_project_files import generate_module_project_files
from bazelrio_gentool.generate_vendordep_raw_libs import generate_vendordep_raw_libs
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.generate_module_project_files import (
    create_default_mandatory_settings,
)


def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(REPO_DIR, "libraries")

    force_tests = False

    group = get_ctre_dependencies(
        use_local_allwpilib=False, use_local_opencv=False, use_local_ni=False
    )

    mandetory_dependencies = create_default_mandatory_settings(
        use_local_roborio=False,
        use_local_bazelrio=False,
    )

    clean_existing_version(REPO_DIR, force_tests=force_tests)
    generate_module_project_files(
        REPO_DIR, group, mandetory_dependencies=mandetory_dependencies
    )
    generate_meta_deps(output_dir, group, force_tests)


if __name__ == "__main__":
    """
    bazel run @bzlmodrio-ctre//generate:generate_ctre
    """
    main()
