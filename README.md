# dotfiles
This is a repo to keep my config files versioned. Just clone it to home directory and run `setup.sh` scirpt using the desirable option to try them out. 

_Don't forget to backup your personal files before!_

## For settting up
```
apt install git

cd ~
git clone -b termux https://github.com/ghadj/dotfiles.git
sh dotfiles/install-scripts/setup.sh <option>
```

## Dracula theme for termux [[source]](https://draculatheme.com/termux/)
```
apt install wget

cd ~
wget https://github.com/dracula/termux/archive/master.zip
unzip master
cp termux-master/colors.properties ~/.termux/
```
