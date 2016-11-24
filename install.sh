#!/bin/bash

reporoot=$(readlink -f $(dirname $0))

curl -sSOL https://raw.githubusercontent.com/roxell/local-inst-lib/master/install-lib
source install-lib

install_files=(
    "$HOME/.shell:${reporoot}/shell"
    "$HOME/.zsh:${reporoot}/zsh"
    "$HOME/.zshrc:${reporoot}/zsh/zshrc"
    "$HOME/.zlogin:${reporoot}/zsh/zlogin"
    "$HOME/.dir_colors:${reporoot}/dir_colors"
    "$HOME/.bash:${reporoot}/bash"
    "$HOME/.bashrc:${reporoot}/bash/bashrc"
    "$HOME/.bash_profile:${reporoot}/bash/bash_profile"
    "$HOME/.bash_logout:${reporoot}/bash/bash_logout"
    "$HOME/.screenrc:${reporoot}/screenrc"
    "$HOME/.toprc:${reporoot}/toprc"
    "$HOME/.terminfo:${reporoot}/terminfo"
    "$HOME/.tmux.conf:${reporoot}/tmux/tmux.conf"
)

create_symlink

###############################################################################
# vim: set ts=4 sw=4 sts=4 et                                                 :
