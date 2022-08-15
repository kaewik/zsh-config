#!/bin/bash

PROJECT_FOLDER=$(cd `dirname $0` && pwd)

set_up_links () {
    ln -nfs $PROJECT_FOLDER/zshenv $HOME/.zshenv
    ln -nfs $PROJECT_FOLDER/zprofile $HOME/.zprofile
    ln -nfs $PROJECT_FOLDER/zshrc $HOME/.zshrc
    ln -nfs $PROJECT_FOLDER/zlogin $HOME/.zlogin
    ln -nfs $PROJECT_FOLDER/zlogout $HOME/.zlogout

    source $HOME/.zshenv

    ln -nfs $PROJECT_FOLDER/zshenv $ZDOTDIR/.zshenv
    ln -nfs $PROJECT_FOLDER/zprofile $ZDOTDIR/.zprofile
    ln -nfs $PROJECT_FOLDER/zshrc $ZDOTDIR/.zshrc
    ln -nfs $PROJECT_FOLDER/zlogin $ZDOTDIR/.zlogin
    ln -nfs $PROJECT_FOLDER/zlogout $ZDOTDIR/.zlogout
    ln -nfs $PROJECT_FOLDER/p10k.zsh $ZDOTDIR/.p10k.zsh
}

set_up_links
echo -e "PROJECT_FOLDER=$PROJECT_FOLDER\n$(cat $PROJECT_FOLDER/zshrc)" > $PROJECT_FOLDER/zshrc 

