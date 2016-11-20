# functions.sh

my_pwd ()
{
    a=$(echo `pwd` | sed "s:$HOME:~:g")
    b=`echo $a | egrep "\/[^\/]*[^\/]*\/[^\/]*\/[^\/]*$" -o`

    if [ "$b" == "" ]; then
        echo $a
    else
        if [ "$a" != "$b" ]; then
            echo -n "..."
        fi
        echo $b
    fi
}

##############################################################################
# vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4                        :
