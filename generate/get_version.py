from get_phoenix_dependencies import get_phoenix_dependencies


def main():
    group = get_phoenix_dependencies()
    print(group.version)


if __name__ == "__main__":
    main()
