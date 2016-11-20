# setup_colors.zsh

autoload spectrum && spectrum

cache_color_d_blue="$FG[019]"
cache_color_m_blue="$FG[027]"
cache_color_l_blue="$FG[039]"

cache_color_d_purp="$FG[055]"
cache_color_m_purp="$FG[165]"
cache_color_l_purp="$FG[147]"

cache_color_d_red="$FG[124]"
cache_color_m_red="$FG[196]"
cache_color_l_red="$FG[210]"

cache_color_d_yell="$FG[100]"
cache_color_m_yell="$FG[227]"
cache_color_l_yell="$FG[229]"

cache_color_d_gren="$FG[028]"
cache_color_m_gren="$FG[046]"
cache_color_l_gren="$FG[120]"

cache_color_d_teal="$FG[030]"
cache_color_m_teal="$FG[051]"
cache_color_l_teal="$FG[123]"

cache_color_m_pink="$FG[206]"
cache_color_m_brwn="$FG[130]"
cache_color_m_orng="$FG[208]"
cache_color_m_grey="$FG[244]"
cache_color_l_whte="$FG[230]"

cache_color_end="$FX[reset]"


#################
## Default colors
cache_color_ret=$cache_color_l_whte
cache_color_venv=$cache_color_m_teal
cache_color_pwd=$cache_color_m_brwn
cache_color_git=$cache_color_m_orng
cache_color_lin=$cache_color_m_grey

cache_color_usr=$cache_color_m_yell
cache_color_hst=$cache_color_d_yell


#################################
# Check if we're in a SSH session
if [ -n "$SSH_CLIENT" ]; then
    #cache_color_lin=$cache_color_m_teal
    prompt_hst="@$HOSTNAME.$DOMAINNAME"
else
    prompt_hst=""
fi


if [[ $USER = root ]]
then
    prompt_hst="@$HOSTNAME.$DOMAINNAME"
    cache_color_usr=$cache_color_m_red
    cache_color_hst=$cache_color_d_red
fi


##################
## Colors for 'ls'
if [ -e "$HOME/.dir_colors" ]; then
    eval `dircolors -b $HOME/.dir_colors`
elif [ -e "/etc/DIR_COLORS" ]; then
    eval `dircolors -b /etc/DIR_COLORS`
else
    eval `dircolors -b`
fi

##############################################################################
# vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4                        :
