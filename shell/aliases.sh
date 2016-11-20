# aliases.sh

alias cls=clear
alias ls="ls --color=if-tty"
alias v='ls -l'
alias ll='ls -l'
alias dfh='df -h -x none -x tmpfs -x fuse -x rootfs -x devtmpfs'
alias confcat='sed -e "s/#.*//;/^\s*$/d"'
alias grep='grep --color'
alias git='UMASK=002 git'

alias xtrem='xterm -fg white -bg black -fa "mono-8" "$@" '
alias ee='gpicview'

mkcd() {
    mkdir $1 && cd $1
}

###############################################################################
# vim: set expandtab shiftwidth=4 tabstop=4 softtabstop=4                     :