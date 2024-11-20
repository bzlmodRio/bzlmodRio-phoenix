import argparse
import os

from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.cli import GenericCliArgs, add_generic_cli
from bazelrio_gentool.generate_group import generate_meta_deps
from bazelrio_gentool.generate_module_project_files import (
    create_default_mandatory_settings,
    generate_module_project_files,
)
from get_phoenix_dependencies import get_phoenix_dependencies


def main():
    SCRIPT_DIR = os.environ["BUILD_WORKSPACE_DIRECTORY"]
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(REPO_DIR, "libraries")

    parser = argparse.ArgumentParser()
    add_generic_cli(parser)
    parser.add_argument("--use_local_allwpilib", action="store_true")
    parser.add_argument("--use_local_opencv", action="store_true")
    parser.add_argument("--use_local_ni", action="store_true")
    args = parser.parse_args()

    group = get_phoenix_dependencies(
        use_local_allwpilib=args.use_local_allwpilib,
        use_local_opencv=args.use_local_opencv,
        use_local_ni=args.use_local_ni,
    )

    mandatory_dependencies = create_default_mandatory_settings(GenericCliArgs(args))

    clean_existing_version(REPO_DIR, force_tests=args.force_tests)
    generate_module_project_files(
        REPO_DIR,
        group,
        mandatory_dependencies=mandatory_dependencies,
        include_windows_arm_compiler=False,
    )
    generate_meta_deps(output_dir, group, force_tests=args.force_tests)

    manual_cleanup(REPO_DIR)


def manual_cleanup(repo_dir):
    # Manual cleanup
    cleanup_file = os.path.join(
        repo_dir, "libraries", "cpp", "wpiapi-cpp", "BUILD.bazel"
    )
    with open(cleanup_file, "r") as f:
        contents = f.read()

    contents = contents.replace("@bzlmodrio-phoenix6//libraries", "//private")
    with open(cleanup_file, "w") as f:
        f.write(contents)


if __name__ == "__main__":
    """
    bazel run @bzlmodrio-ctre//generate:generate_ctre
    """
    main()
