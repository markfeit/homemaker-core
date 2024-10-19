#
# Re-read the RC
#

debug __file__

case "$(uname -s)" in
    Linux)
	file_mtime()
	{
	    stat -c '%Y' "$1"
	}
    ;;
    Darwin)
	file_mtime()
	{
	    stat -f '%m' "$1"
	}
    ;;
    *)
	file_mtime()
	{
	    echo 0
	}
    ;;
esac

BASHRC="${HOME}/.bashrc"

BASHRC_MODIFIED=$(file_mtime "${BASHRC}")

# Redefining this while it's running causes problems.
# Don't redefine this while it's running because it causes infinite loops
if [ -z "${REREADING_BASHRC}" ]
then
    bash_env_auto_resource()
    {
	BASHRC_TIME=$(file_mtime "${BASHRC}")
	if [ "${BASHRC_TIME}" -gt "${BASHRC_MODIFIED}" ]
	then
	    printf "\n*** Re-reading modified ${BASHRC}.\n\n"
	    REREADING_BASHRC=1
	    . "${BASHRC}"
	    unset REREADING_BASHRC
	    BASHRC_MODIFIED="${BASHRC_TIME}"
	fi
    }
fi

# TODO: This should be done in a way that multiple commands can be
# stacked up by other sections.
PROMPT_COMMAND="bash_env_auto_resource"

# This will force a re-read of the file by making it look newer.
alias resource='unset REREADING_BASHRC && source "${BASHRC}"'
