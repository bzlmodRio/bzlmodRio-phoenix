import os
from get_ctre_dependencies import get_ctre_dependencies
from bazelrio_gentool.publish_module import publish_module


def main():
    SCRIPT_DIR = os.environ["BUILD_WORKSPACE_DIRECTORY"]
    registry_location = os.path.join(
        SCRIPT_DIR, "..", "..", "..", "bazel-central-registry"
    )

    group = get_ctre_dependencies()

    os.chdir(SCRIPT_DIR)
    publish_module(
        registry_location, group, module_json_template=None, module_template=None
    )


if __name__ == "__main__":
    main()
