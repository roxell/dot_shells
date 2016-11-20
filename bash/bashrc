# Sourcing stuff...
BASH=$HOME/.bash
SH=$HOME/.shell

source $SH/environment.sh
source $SH/aliases.sh
source $SH/functions.sh

source $BASH/functions.sh
source $BASH/prompt.sh

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now
	return
fi

# uncomment the following to activate bash-completion:
[[ -f /etc/profile.d/bash-completion ]] && source /etc/profile.d/bash-completion

##############################################################################
# vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4                        :
