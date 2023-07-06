Mmm... files

<!--
```bash
curl https://raw.githubusercontent.com/0x6969766f/dotfiles/main/bin/install.sh --output install.sh
chmod +x install.sh
sh install.sh
```
-->

```bash
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/0x6969766f/dotfiles/main/bin/dotfiles)"
```

TODO:

- https://github.com/ALT-F4-LLC/dotfiles

TODO:

- Split configurations into profiles
- Interactive prompt to select:
  - profile(s)
  - brew packages
  - mas packages
  - vscode extensions
- Generate SSH keys based on profile selection before running playbook
- Generate NPM key if profile is work
- Separate tasks for symlinks (don't loop)
- Installing vscode extensions should have prettier output
- Imporved .gitconfig
- See if tasks can be combined?

References:

- [alexdesousa/dotfiles](https://github.com/alexdesousa/dotfiles)
- [anuvyklack/dotfiles](https://github.com/anuvyklack/dotfiles)
- [bradleyfrank/ansible](https://github.com/bradleyfrank/ansible)
- [frdmn/dotfiles](https://github.com/frdmn/dotfiles)
- [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)
- [jansroka/dotfiles](https://github.com/jansroka/dotfiles)
- [kespinola/dotfiles](https://github.com/kespinola/dotfiles)
