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

}

set_up_links

