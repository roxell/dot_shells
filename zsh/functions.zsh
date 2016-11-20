# functions.zsh
#

function zsh_precmd() {
    [[ $last_exit_status -ne 0 ]] && \
        cache_color_ret=$cache_color_m_red || \
        cache_color_ret=$cache_color_l_whte

    [[ -w $PWD ]] && \
        cache_color_pwd=$cache_color_m_grey || \
        cache_color_pwd=$cache_color_m_purp

    [[ ! -z "$VIRTUAL_ENV" ]] && \
        prompt_venv=$(basename "$VIRTUAL_ENV") || \
        prompt_venv=""
}

###############################################################################
# vim: set expandtab shiftwidth=4 tabstop=4 softtabstop=4                     :
