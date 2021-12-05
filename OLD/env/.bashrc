
echo "wunderbar.."

ls "$GUIX_ENVIRONMENT/bin"

if [ -n "$GUIX_ENVIRONMENT" ]
then
    export PS1="\u@\h \w [dev]\$ "
fi
