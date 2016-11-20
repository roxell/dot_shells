# prompt.sh
COL_RED="\[\033[38;5;196m\]"
COL_GRAY="\[\033[38;5;245m\]"
COL_GRENYELL="\[\033[38;5;100m\]"
COL_PINK="\[\033[38;5;206m\]"
COL_TEAL="\[\033[38;5;038m\]"
COL_GREN="\[\033[38;5;035m\]"
COL_BLUE="\[\033[38;5;021m\]"
COL_BROWN="\[\033[38;5;130m\]"
COL_YELLOW="\[\033[38;5;227m\]"
COL_ORANGE="\[\033[38;5;208m\]"
COL_WHITE="\[\033[00;37m\]"
COL_NONE="\[\033[00m\]"
COL_MAGENTA="\[\033[00;35m\]"
COL_55="\[\033[38;5;55m\]"
COL_72="\[\033[38;5;72m\]"
COL_97="\[\033[38;5;97m\]"

COL_SCM=$COL_ORANGE
COL_ECODE=$COL_MAGENTA
COL_PATH=$COL_MAGENTA
COL_USER=$COL_YELLOW
COL_HOST=$COL_RED
COL_LINE=$COL_WHITE

[[ -n "$SSH_CLIENT" ]] && COL_LINE=$COL_TEAL
[[ $(whoami) == "root" ]] && COL_LINE=$COL_PINK

export PS1="$COL_LINE/-($COL_USER\u$COL_LINE@$COL_HOST$(hostname -s)$COL_LINE)-<$COL_SCM\$(get_git_status)$COL_LINE>-<$COL_PATH\w$COL_LINE>\n$COL_LINE\-($COL_ECODE\${?}$COL_LINE) \$$COL_NONE "

##############################################################################
# vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4                        :
