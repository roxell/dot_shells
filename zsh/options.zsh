## Global variables
setopt NO_BG_NICE

## History-thingies
export HISTSIZE=6144
export SAVEHIST=4096
export HISTFILE=~/.zsh_history
#setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
#setopt HIST_IGNORE_ALL_DUPS
#setopt HIST_SAVE_NO_DUPS

## Globbing... E.g. "ls ^upload" lists everything _but_ upload
setopt extended_glob

## Autopush directories on the directory-stack
## Use ~-<tab> to tabcomplete the directories you've visited before in
##  this shell
setopt autopushd

## Don't kill off background jobs when zsh exits
setopt nohup


