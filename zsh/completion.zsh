# completion.zsh

# Initialize completion system
autoload -Uz compinit && compinit -u

zstyle ':completion:*' special-dirs ..

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

##############################################################################
# vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4                        :
