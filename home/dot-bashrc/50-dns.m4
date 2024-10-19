#
# Local Domain Search
#

debug __file__

dnf Enable this to set LOCALDOMAIN
dnf _hm_ifenabled(home,<<<export LOCALDOMAIN="home.example.com example.com">>>)
