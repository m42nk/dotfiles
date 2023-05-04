## Notes

What I realized after installing Ubuntu Desktop on bare metal without ansible:

Package to install:
- `build-essentials`
- `curl`
- `fzf`
- `ripgrep`
- `tealdeer`
- `bat`
- `exa`
- `fd`
- `delta`
- `kitty`

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

- NerdFont (done, with ansible)
- Wakatime apikey
- Neovim unattended first setup
- Chrome

