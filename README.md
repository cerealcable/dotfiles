Morgan's Ansible-Managed Dotfiles
=================================

The collection of dotfiles I've accumulated and tested and refined for my own use. All packaged up with Ansible so that all my homes can be the same. Currently I'm using ArchLinux and this repo is probably too specific to pacman and its helpers.

## Dependencies
Using this on requires...
 * `ansible-aur-git`
 * `ansible`
 * `make`
 * `git`
 * `yay`

Super easy example:
```shell
# pacman deps
sudo pacman -S ansible git make

# yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# yay deps
yay -S ansible-aur-git

# this repo!
git clone https://github.com/cerealcable/dotfiles.git
make -C dotfiles local
```

## License
This repository is licensed under the [MIT License](LICENSE).

## Inspirations
People around me generally give decent ideas and inspiration, so here's a list of people you should check out!

* [@wastrachan](https://github.com/wastrachan/dotfiles)
