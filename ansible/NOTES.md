## Notes

What I realized after installing Ubuntu Desktop on bare metal without ansible (KDE Plasma):

Package to install:
- `build-essentials`
- `curl`
- `fzf`
- `ripgrep`
- `tealdeer`
- `bat`
- `exa`
- `fd-find`
- `delta` (via ansible, curl files)
- `kitty`
- `python3-venv`
- `lazygit`

Setups to do:
- Update alternatives, set `EDITOR` to `nvim`
- Update alternatives, set `python3` to `python`
    ```
    whereis python3
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 20
    pip install ansible --break-system-packages
    ```
- Setup git config
    ```
    git config --global user.email "mail.syakhisk@gmail.com"
    git config --global user.name "Syakhisk Al-Azmi"
    ```

- Wakatime apikey
- Chrome
- Setup touchpad scroll natural

Post Install:
- `cd $DOTFILES/ansible && make --tags "all"`
- gh auth login
- Setup dotfiles (need to makesure above packages are installed first)
- Neovim unattended first setup
    - wakatime api key
    - setup `:Copilot`


Order of run:
- Clone this repo
    ```
    cd $HOME
    git clone --recursive https://github.com/m42nk/dotfiles Dotfiles
    cd dotfiles/ansible
    ./prepare.sh
    make --tags "all"
    ```
