# The ${key[Key]} thingies won't work unless you run through
# the following for each terminal-type you source this zshrc
# from:
#zsh /usr/share/zsh/<version>/functions/Misc/zkbd
if [ -f $HOME/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE} ]; then
    source $HOME/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE}
fi

[[ -n ${key[Home]} ]]    && bindkey "${key[Home]}"     beginning-of-line
[[ -n ${key[End]} ]]     && bindkey "${key[End]}"      end-of-line
[[ -n ${key[Delete]} ]]  && bindkey "${key[Delete]}"   delete-char
[[ -n ${key[Left]} ]]    && bindkey "${key[Left]}"     backward-char
[[ -n ${key[Right]} ]]   && bindkey "${key[Right]}"    forward-char

[[ -n ${key[Left]:l} ]]  && bindkey "${key[Left]:l}"   vi-backward-word
[[ -n ${key[Right]:l} ]] && bindkey "${key[Right]:l}"  vi-forward-word

[[ -n ${key[Up]} ]]    && bindkey "${key[Up]}"     up-line-or-history # Up, cursor at end of line
[[ -n ${key[Down]} ]]  && bindkey "${key[Down]}"   down-line-or-history # Down, cursor at end of line
#[[ -n ${key[Up]:l} ]]    && bindkey "${key[Up]:l}"     history-beginning-search-backward # Shift Up
#[[ -n ${key[Down]:l} ]]  && bindkey "${key[Down]:l}"   history-beginning-search-forward # Shift Down
bindkey "\ek"  history-beginning-search-backward
bindkey "\ej"  history-beginning-search-forward
bindkey "\eh"  beginning-of-line
bindkey "\el"  end-of-line
bindkey "^E"  delete-word
bindkey "^Q"  backward-kill-line
bindkey "^R"  kill-line
bindkey '\e.' insert-last-word
bindkey '\eq'   push-line   # Alt-Q; pushes line to next prompt-line and empties
                            # the current one

##############################################################################
# vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4                        :
