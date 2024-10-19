#
# Basic Initialization
#

unalias -a

debug()
{
    if [ -n "$BASHRC_DEBUG" ]
    then
	echo "$(date)": "$@"
    fi
}

debug __file__

