# .dotfiles
Collection of my **Gruvbox**-themed dotfiles.

---

## Prerequisites
This repository is organized in `packages` in order to be managed with GNU `stow`, which is a utility to avoid the burden of custom install scripts or manual installations for dotfiles.

### Installing GNU `stow` on Arch Linux:
```bash
sudo pacman -S stow
```

---

## How to install packages
1. See [Prerequisites](#prerequisites)
2. Clone this repository to your local machine:
```bash
git clone https://github.com/Noxmor/.dotfiles.git
```
3. Navigate into your local version of this repository and run the following command:
```bash
stow <package-name>...
```
> [!NOTE]
Every directory in this repository is a `package`.
