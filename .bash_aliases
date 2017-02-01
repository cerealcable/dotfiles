# Load files from Projects
SCREEN_FILES=`ls -a ~/Projects/*/.screenrc-* ~/.screenrc-* 2>/dev/null`
for FILE in $SCREEN_FILES;
do
        NAME=`echo $FILE | rev | cut -d- -f1 | rev`;
        alias $NAME="screen -c $FILE"
done

# Static aliases
alias ssh-adtran='ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -oHostKeyAlgorithms=+ssh-dss'
alias tv='terminal_velocity'
alias hm='history | grep make_image'

# ls
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'

# grep
#alias egrep='egrep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias grep='grep --color=auto'
#alias cgrep='find $1 \( -iname "*.H" -o -iname "*.C" \) -print0 | xargs -P8 -0 grep -n'
#alias cppgrep='find $1 \( -iname "*.CPP" -o -iname "*.CC" -o -iname "*.H" -o -iname "*.HPP" \) -print0 | xargs -P8 -0 grep -n'
#alias hgrep=' find $1 \( -iname "*.H" -o -iname "*.HPP" \) -print0 | xargs -P8 -0 grep -n'
#alias mgrep=' find $1 \( -iname "Rules*" -o -iname "make*" -o -iname "*.inc" \) -print0 | xargs -P8 -0 grep -n'
#alias pygrep='find $1 \( -iname "*.py" \) -print0 | xargs -P8 -0 grep -n'
#alias rgrep=' find $1 \( -iname "*.rb" \) -print0 | xargs -P8 -0 grep -n' 

# LXC
lxcsh () { lxc exec $1 -- /bin/bash; }
lxc-apt-update () {
    running="$(lxc list -c ns | awk '!/NAME/{ if ( $4 == "RUNNING" ) print $2}')"
    for container in $running
    do
        echo "Updating Ubuntu LXD Container \"$container\"...";
        lxc exec $container -- /bin/bash -c "apt -qq update";
        lxc exec $container -- /bin/bash -c "apt -qq -y full-upgrade";
        lxc exec $container -- /bin/bash -c "apt -qq -y autoremove --purge";
        lxc exec $container -- /bin/bash -c "apt -qq -y clean";
    done
}
