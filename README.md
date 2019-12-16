## Common Shell Environment Setup

This set of scripts is intended to keep a common environment across my shells on various systems. It stores a set of my aliases in a `.bash_aliases` file and common settings in `.commonrc`. To activate all these, the `.commonrc` script is sourced from respective shell environments.

### Usage

Simply clone this repo and run the following:
```
$ ./install.sh
# exec "$SHELL"
```

Any existing settings are saved in a `.bak` file and the diffs are presented to the user with the option to either keep or delete the respective `.bak` file.

### Adding new shells

To add new shell environments, simply edit the `CONFIG_FILES` array near the top of the `install.sh` files to add the configuration files to be sourced for the new shell.

