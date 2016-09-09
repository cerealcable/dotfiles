# Load files from Projects
SCREEN_FILES=`ls -a ~/Projects/*/.screenrc-* ~/.screenrc-*`
for FILE in $SCREEN_FILES;
do
        NAME=`echo $FILE | rev | cut -d- -f1 | rev`;
        alias $NAME="screen -c $FILE"
done

# Static aliases
alias ssh-adtran='ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -oHostKeyAlgorithms=+ssh-dss'

