# dotfiles

<img width="2056" alt="image" src="https://github.com/user-attachments/assets/478ad40c-8b66-447e-b284-4964442d4bea">


> Dotfiles are used to customize your system. The “dotfiles” name is derived from the configuration files in Unix-like systems that start with a dot (e.g. .bash_profile and .gitconfig). For normal users, this indicates these are not regular documents, and by default are hidden in directory listings. For power users, however, they are a core tool belt. 
> [Source](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)


## Directory structure
```
.
├── .meta/
├── .misc/
├── profiles/
│   ├── default
│   └── [more-profile]
├── configs/
│   ├── zsh.yaml
│   ├── neovim.yaml
│   └── [more-config]
├── os/
│   ├── macos
│   └── [more-os]
└── packages/
    ├── zsh/
    ├── nvim/
    └── [other-packages]
```
## Dotfile management tools

- [dotbot](https://github.com/anishathalye/dotbot)
- [ansible](https://ansible.com)


### Config
A `config` is a `.yaml` file similar to dotbot's `install.conf.yaml`.
This is a set of instruction and directive to install your dotfiles
(linking, cleaning symlinks, running shell commands, etc).

Example:
```yaml
# ./configs/default.yaml

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
# ./profiles/linux

default
xorg
kde
```

```
# ./profiles/macos

default
brew
```


### `./profiles/`
A directory which contains all of the profile


### `install-profile`
A script to install **configurations** based on a **profile** defined in `./profiles`.


Usage:
```
$ ./install-profile [some-profile]
```


### `install-standalone`
A script to install **configurations** based on a **config** defined in `./configs`.

Usage:
```
$ ./install-standalone [some-config] [other-config]
```

Note:
 - Multiple argument is supported if you want to install multiple config from `./configs`


### Credits and inspiration
- [ansible-dotfiles (TODO)]()
- [dotbot](https://github.com/anishathalye/dotbot)
- [ecarlson94](https://github.com/ecarlson94/dotbot-template)
- [vbriand](https://github.com/vbriand/dotfiles)
