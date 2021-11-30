# dotfiles
My dotfiles for GNU Stow. Right now it is mainly my basic vim configurations and nothing else. I plan on adding more as I branch out.

To install the configurations, simply run the `stow_up.sh` script. If you make a mistake and need to remove the symlinks, then use the `stow_down.sh` script.

## vim
Vim is **the** text editor and I like mine configured closely to stock with some of the creature comforts enabled.

There are now submodules included in the vim folder for the vim plugins. When adding dotfiles to a new machine, be sure the initialize the submodules for the vim plugins to be populated. This can be done with the `git submodule update --init --remote --recursive` command run from the project root. To update the plugins, this can be done using the `git submodule update --remote --recursive` command run from the project root. The `git submodule foreach ...` command can be useful for working on all submodules, but specifying a specific action.

## fish
Nothing too special here, just declaring my love of vim bindings and setting vim as my default editor.
