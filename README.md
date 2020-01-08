# Path modification bash script

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/cabedb7d336540ef9db2a386e42217b2)](https://www.codacy.com?utm_source=github.com&utm_medium=referral&utm_content=rickstaa/pathmod&utm_campaign=Badge_Grade)
[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green)](https://github.com/rickstaa/pathmod/pulse)
[![Contributions](https://img.shields.io/badge/contributions-welcome-orange.svg)](contributing.md)
![Supported shells](https://img.shields.io/badge/Supported%20shells-bash-blue)

The pathmod bash script makes it easier to view and modify the PATH and PYTHONPATH environment variables. It comes with an easy command-line interface which allows you to:

-   Display the paths that are on the PATH and PYTHONPATH in a more readable format.
-   Check whether a path is on the PATH or PYTHON.
-   Delete a path from the PATH or PYTHONPATH.
-   Add a path from the PATH or PYTHONPATH.
-   Move a path to a different position in the PATH or PYTHONPATH.

## How to setup

### Automatic installation

1.  Clone the repository to your user home directory and cd into the `.pathmod` folder.

    ```bash
    git clone https://github.com/rickstaa/.pathmod.git
    cd .ros_conda_wrapper
    ```

2.  Run the `install.sh` script to install the ROS Conda wrapper.

### Manual installation

1.  Create a symbolic link to the `.pathmod_rc` file:

    ```bash
    ln -fs "$(pwd)/.pathmod_rc" "$(echo $HOME)/.pathmod_rc"
    ```

2.  Add the following code at the end of your `.bashrc`.

    ```sh
    # >>> pathmod initialize >>
    ## Source pathmod script
    if [ -f "$HOME/.pathmod_rc" ]; then
     . "$HOME/.pathmod_rc"
    fi
    # <<< pathmod initialize <<<
    ```

## How to uninstall

To uninstall the pathmod script run the `uninstall.sh` script before removing the `.pathmod` repository.

## How to use

### Pathmod commands

The pathmod script takes the following commands:

-   `-a --add`: Add path(s) to the PATH or PYTHONPATH
-   `-i --index:` Specify the index where to add the path(s) (OPTIONAL: 0=start, -1=end, defaults to -1)
-   `-m --move`: Move a path to a given index (Adds path if not yet present.)
-   `-r --remove`: Remove path(s) from the PATH or PYTHONPATH
-   `-c --check`: Check if path exists in the PATH or PYTHONPATH
-   `-h --help`: Display help
-   `-p --pythonpath`: Modify PYTHONPATH instead of PATH
-   `-s --settings`: List pathmod settings and the current PATH and PYTHONPATH
-   `-sd --set-path-display`: Display PATH and PYTHONPATH after each command (OPTIONAL, defaults to false)
-   `-se --set-export`: Export path after it is set (OPTIONAL, defaults to true)

:information_source: **NOTE:** Each option only accepts one argument at the same time. To add, remove or check multiple paths please use the colon separator (example: `$PROGNAME --<OPTION> "<PATH1>:<PATH2>"`).

#### Examples

```bash
Add path to PATH variable:
$PROGNAME --add <PATH>

Add path to PATH at an index:
$PROGNAME --add <PATH> --index <INDEX>

Remove path from PATH variable:
$PROGNAME --remove <PATH>

Check if path exists in PATH varible:
$PROGNAME --exists <PATH>

Move path to a given index:
$PROGNAME --move <PATH> --index <INDEX>

Add path from PYTHONPATH variable:
$PROGNAME --pythonpath --add <PATH>
```

## Contributing

Contributions to this repository are welcome. See the [contribution guidelines](contributing.md) for more information.

## License

[MIT](LICENSE)
