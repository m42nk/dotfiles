# dotfiles

> Dotfiles are used to customize your system. The “dotfiles” name is derived from the configuration files in Unix-like systems that start with a dot (e.g. .bash_profile and .gitconfig). For normal users, this indicates these are not regular documents, and by default are hidden in directory listings. For power users, however, they are a core tool belt. 
> [Source](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)


## Dotfile management tools

This dotfiles is powered by [dotbot](https://github.com/anishathalye/dotbot)


## Directory structure
```
.
├── install-profile
├── install-standalone
└── meta/
    ├── base.yaml
    ├── configs/
    │   ├── [some-config].yaml
    │   └── [more-config].yaml
    └── profiles/
        ├── [some-proile]
        └── [other-profile]
```

### Config
A `config` is a `.yaml` file similar to dotbot's `install.conf.yaml`.
This is a set of instruction and directive to install your dotfiles
(linking, cleaning symlinks, running shell commands, etc).

Example:
```yaml
# ./meta/configs/default.yaml

- link:
    $HOME/.config/nvim: nvim
    $HOME/.config/tmux: tmux
```

This setup will create a symlink from `./nvim` (on the root dir) to `$HOME/.config/nvim`


### Profile
a profile is a text file listing a set of `config`.
You can make each profile a machine that have different configs attached to it.

Example:
```
# ./meta/profiles/linux

default
xorg
kde
```

```
# ./meta/profiles/macos

default
brew
```


### `./meta/profiles/`
A directory which contains all of the profile


### `install-profile`
A script to install **configurations** based on a **profile** defined in `./meta/profiles`.


Usage:
```
$ ./install-profile [some-profile]
```


### `install-standalone`
A script to install **configurations** based on a **config** defined in `./meta/configs`.

Usage:
```
$ ./install-config [some-config] [other-config]
```

Note:
 - Multiple argument is supported if you want to install multiple config from `./meta/configs`
