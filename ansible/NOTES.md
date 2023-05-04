## Notes

What I realized after installing Ubuntu Desktop on bare metal without ansible:

Package to install:
- `build-essentials`

Setups to do:
- Update alternatives, set `EDITOR` to `nvim`
- Update alternatives, set `python3` to `python`
    ```
    whereis python3
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 20
    ```
- Setup git config
    ```
    git config --global user.email "mail.syakhisk@gmail.com"
    git config --global user.name "Syakhisk Al-Azmi"
    ```

