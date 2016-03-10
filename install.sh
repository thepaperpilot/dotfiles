#! /bin/bash

FLAGS=-s

while test $# -gt 0; do
    case "$1" in
        -overwrite)
            FLAGS=-sf
            shift
            ;;
    esac
done

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln $FLAGS $DIR/bash_aliases ~/.bash_aliases
ln $FLAGS $DIR/bashrc ~/.bashrc
ln $FLAGS $DIR/Xdefaults ~/.Xdefaults
ln $FLAGS $DIR/gitconfig ~/.gitconfig
ln $FLAGS $DIR/profile ~/.profile
ln $FLAGS $DIR/gtkrc-2.0 ~/.gtkrc-2.0

ln $FLAGS $DIR/config/compton.conf ~/.config/compton.conf

ln $FLAGS $DIR/config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
ln $FLAGS $DIR/config/gtk-3.0/bookmarks ~/.config/gtk-3.0/bookamrks

ln $FLAGS $DIR/config/htop/htoprc ~/.config/htop/htoprc

ln $FLAGS $DIR/config/i3/config ~/.config/i3/config
