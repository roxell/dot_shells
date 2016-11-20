# functions.sh
#

get_git_status() {
    local d=$(git rev-parse --git-dir 2>/dev/null ) b= r= a= c= e= f= g= rel=
    if [[ -n "${d}" ]] ; then
        if [[ -d "${d}/../.dotest" ]] ; then
            if [[ -f "${d}/../.dotest/rebase" ]] ; then
                r="rebase"
            elif [[ -f "${d}/../.dotest/applying" ]] ; then
                r="am"
            else
                r="???"
            fi
            b=$(git symbolic-ref HEAD 2>/dev/null )
        elif [[ -f "${d}/.dotest-merge/interactive" ]] ; then
            r="rebase-i"
            b=$(<${d}/.dotest-merge/head-name)
        elif [[ -d "${d}/../.dotest-merge" ]] ; then
            r="rebase-m"
            b=$(<${d}/.dotest-merge/head-name)
        elif [[ -f "${d}/MERGE_HEAD" ]] ; then
            r="merge"
            b=$(git symbolic-ref HEAD 2>/dev/null )
        elif [[ -f "${d}/BISECT_LOG" ]] ; then
            r="bisect"
            b=$(git symbolic-ref HEAD 2>/dev/null )"???"
        else
            r=""
            b=$(git symbolic-ref HEAD 2>/dev/null )
        fi

        git_porcelain=$(git status --porcelain --branch 2>/dev/null)
        if echo "$git_porcelain" | grep -q '^[ MARC][MD]' ; then
            a="${a}*"
        fi

        if echo "$git_porcelain" | grep -q '^[MADRC]' ; then
            a="${a}+"
        fi

        if echo "$git_porcelain" | grep -q '^??' ; then
            a="${a}?"
        fi

        e=$(echo "$git_porcelain" | head -n1 | sed -n -e '/^##.*\(ahead\|behind\).*/{ s/.*\[//; s/\].*//; s/ahead\s\+\([0-9]\+\)/+\1/; s/behind\s\+\([0-9]\+\)/-\1/; p}' )
        [[ -z ${e} ]] && e=

        rel="$(git rev-parse --show-prefix)"
        rel=${rel%/}

        b=${b#refs/heads/}
        b=${b// }
        [[ -n "${b}" ]] && c="$(git config "branch.${b}.remote" 2>/dev/null )"
        [[ -n "${r}${b}${c}${a}" ]] && s="[${b}${c:+@${c}}]${r:+ <${r}>}${e:+ ${e}}${a:+ ${a}}"
    fi

    echo -n "$s"
}

function precmd() {
    last_exit_status=$?
    git_status="$(get_git_status)"

    case $TERM in
        *xterm*|*rxvt*)
            print -Pn "\e]0;%n@%m:%~\a"
            ;;
        screen*)
            print -Pn "\033\"%n@%m:%~\033\134"
            ;;
    esac

    # Run shell-specific precmd function
    shell_name=$(basename $SHELL)
    which ${shell_name}_precmd >/dev/null && ${shell_name}_precmd
}

function preexec() {
    command=$(print -P "%60>...>$1")
    case $TERM in
        *xterm*|*rxvt*)
            print -Pn "\e]0;$command (%~) : %n@%m\a"
            ;;
    esac
}

##############################################################################
# vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4                        :
