# Start fetchmail at login
if [[ -f $HOME/.fetchmailrc && -x /usr/bin/fetchmail ]]; then
    #ps -C fetchmail -o 'user= pid= comm=' |egrep $USER 1>/dev/null 2>&1 || fetchmail
    pgrep -u $USER fetchmail || /usr/bin/fetchmail
fi

[[ -x $HOME/bin/dbus_session.sh ]] && $HOME/bin/dbus_session.sh

# vim: set et ts=4 sts=4 tw=80
