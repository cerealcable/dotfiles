# Morgan's Dotfiles

The collection of dotfiles I've accumulated and tested and refined for my own use. My primary environment is Linux distro's but generally these could be used in other scenarios.

## Dependencies
```
apt install gcc python-setuptools python-dev xclip exuberant-ctags
easy_install pip
```

## ArchLinux
Using this on ArchLinux requires `yay` and `ansible-aur-git`
```
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S ansible-aur-git
```


## Installation

```
git clone https://github.com/morganhumes/dotfiles.git
make -C dotfiles install
```


## Environments

I wanted different environments based upon what kind of work I did, you can do so with different targets as `make install-<environment>`.
