# SSH Basics

# Match hosts based on actual name rather than alias
CanonicalizeHostname yes

Host *
    Compression no
    ForwardX11 no

# Note that the default searched-for keys are ~/.ssh/id_rsa,
# ~/.ssh/id_dsa, ~/.ssh/id_ecdsa and ~/.ssh/identity.
