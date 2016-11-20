# prompt.zsh

# make sure delayed evaluation works
setopt prompt_subst

[[ $USER = root ]] && \
    prompt_user=$(echo $USER |tr '[:lower:]' '[:upper:]') || \
    prompt_user=$USER


# setup cutesy lines
typeset -A altchar
set -A altchar ${(s..)terminfo[acsc]}
PR_SET_CHARSET="%{$terminfo[enacs]%}"
PR_SHIFT_IN="%{$terminfo[smacs]%}"
PR_SHIFT_OUT="%{$terminfo[rmacs]%}"

pr_lin_vertical=$PR_SHIFT_IN${altchar[x]:-I}$PR_SHIFT_OUT
pr_lin_horizont=$PR_SHIFT_IN${altchar[q]:--}$PR_SHIFT_OUT
pr_lin_ulcorner=$PR_SHIFT_IN${altchar[l]:-o}$PR_SHIFT_OUT
pr_lin_llcorner=$PR_SHIFT_IN${altchar[m]:-*}$PR_SHIFT_OUT
pr_lin_lrcorner=$PR_SHIFT_IN${altchar[j]:-*}$PR_SHIFT_OUT
pr_lin_urcorner=$PR_SHIFT_IN${altchar[k]:-o}$PR_SHIFT_OUT

[[ -z $DOMAINNAME ]] && export DOMAINNAME="$(hostname -d)"
[[ -z $HOSTNAME ]] && export HOSTNAME="$(hostname -f)"

# finally, set the prompt
PROMPT="$PR_SET_CHARSET"
PROMPT="$PROMPT$cache_color_lin$pr_lin_ulcorner$pr_lin_horizont(\$cache_color_usr\$prompt_user$cache_color_lin$cache_color_hst$prompt_hst$cache_color_lin)"
PROMPT="$PROMPT$cache_color_lin\${prompt_venv:+\$pr_lin_horizont<\$cache_color_venv\${prompt_venv}\$cache_color_lin>}"
PROMPT="$PROMPT$cache_color_lin$pr_lin_horizont<\$cache_color_pwd%~$cache_color_lin>
"
PROMPT="$PROMPT$cache_color_lin$pr_lin_llcorner"
PROMPT="$PROMPT$cache_color_lin\${git_status:+\$pr_lin_horizont<\$cache_color_git\${git_status}\$cache_color_lin>}"
PROMPT="$PROMPT$cache_color_lin$pr_lin_horizont(\$cache_color_ret\$last_exit_status$cache_color_lin) %(!.#.$) $cache_color_end"

##############################################################################
# vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4                        :
