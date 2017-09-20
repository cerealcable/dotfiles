# Morgan's Dotfiles

The collection of dotfiles I've accumulated and tested and refined for my own use. My primary environment is Linux distro's but generally these could be used in other scenarios.

## Dependencies
```
apt install gcc python-setuptools python-dev xclip exuberant-ctags
easy_install pip
```


## Installation

```
git clone https://gitlab.com/cerealcable/dotfiles.git
cd dotfiles
./bootstrap.sh
```


## Environments

I wanted different environments based upon what kind of work I did, you can pass this information to via the -e flag via `bootstrap.sh -e <environtment_name>`
