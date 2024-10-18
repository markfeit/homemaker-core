# Homemaker

Homemaker is a system for generating dot files for your home directory
(e.g., `.bashrc`) and directories containing configuration files
(e.g., `~/.ssh/config`).

## Prerequisites

Homemaker will run on any system that can provide a standard version
of the following:

 * Bourne shell
 * Make
 * M4
 * Rsync


## OS-Specific Notes

### RHEL-Derived Linux

To install the prerequisites:
```
dnf -y install bash make m4 rsync
```

### Debian-Derived Linux

To install the prerequisites:
```
apt-get -y install bash make m4 rsync
```

### macOS X

Homemaker requires `m4` and `make`, which are not provided by default
on macOS.  These may be bootstrapped with Brew before running `make`
in this directory:

 * Follow the installation instructions at https://brew.sh
 * `brew install make m4`
 * `export PATH="/opt/homebrew/opt/m4/bin:/opt/homebrew/opt/make/bin:${PATH}"`


## Configration Options

If `HM_NO_CRONTAB` is defined in the environment or `make` arguments,
Homemaker will not install its maintenance cron job.