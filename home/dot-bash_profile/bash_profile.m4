#
# BASH Profile
#

_hm_ifenabled(Darwin,<<<
# Silence macOS's obnoxious warning
export BASH_SILENCE_DEPRECATION_WARNING=1
>>>)

if [ -e "${HOME}/.bashrc" ]
then
    . "${HOME}/.bashrc"
fi
