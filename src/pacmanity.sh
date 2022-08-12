#!/bin/bash
# Pacmanity
# Keeps a list of installed packages in a Gist at your GitHub account.

pacmanity_install(){
    echo "A list of installed packages will be automatically maintained"
    echo "by Pacmanity in a private Gist at your GitHub account."

    mkdir /etc/pacmanity
    echo -e "A folder, /etc/pacmanity, has just been created."
    echo -e "Please go to that folder and set up a git repo."
    echo -e "Make sure it can be pushed with 'git push origin master' without a password."
    }

pacmanity_update(){
    echo "Pacmanity: Updating list of installed packages."
    save_dir=$(pwd)
    cd /etc/pacmanity
    pacman -Qqen > $HOSTNAME.pacmanity
    pacman -Qqem >> $HOSTNAME.pacmanity
    git commit -a -m "$(date)" --quiet
    git push origin master --quiet
    cd $save_dir
}

pacmanity_update
