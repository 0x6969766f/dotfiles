Mmm... files

```bash
curl https://raw.githubusercontent.com/0x6969766f/dotfiles/main/bin/install.sh --output install.sh
chmod +x install.sh
sh install.sh
```

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
