# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Let's see if wer'e interactive
if [[ -z "$PS1" ]]; then
    export INTERACTIVE=
else
    export INTERACTIVE=yes
fi


# Load files from ~/bashrc.d
for pkg in "$HOME"/bashrc.d/*; do
    [[ "$BURP_DEBUG" == "1" ]] && echo "Loading $pkg..."
    if [[ "$A" =~ ^.*~$ ]]; then
        [[ "$BURP_DEBUG" == "1" ]] && echo "Skipping $pkg since it ends with ~..."
    else
        [[ "$BURP_DEBUG" == "1" ]] && echo "Loading $pkg..."
        # shellcheck source=/dev/null
        source "$pkg"
    fi
done
