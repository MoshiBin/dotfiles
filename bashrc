# Moshi's bashrc

# Section: Functions {{{
_color () { echo -ne "\[\033[38;5;$1m\]"; }
# }}}

# Section: Variables {{{
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# Heroku Toolbelt
[[ -d /usr/local/heroku/bin ]] && export PATH="/usr/local/heroku/bin:$PATH"
# Colorful Prompt
NC="\[\033[0m\]" # No color
export PS1="$(_color 22)[$NC$(_color 34)\u$NC$(_color 46)@$NC$(_color 118)\h$NC $(_color 190)\w$NC$(_color 226)]$NC$(_color 214)\$$NC "
# }}}

# Section: Aliases {{{
alias ls='ls -Gp'
alias ll='ls -l'
alias web='python -m SimpleHTTPServer'
# }}}

# Section: Externals {{{
# virtualenvwrapper
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh
# }}}

# Section: Startup Commands {{{
if type cowsay cowthink lolcat fortune &>/dev/null; then
    msg=$(fortune -a -s)
    speaker=$(cowsay -l | sed '1d;s/ /\n/g' | sort -R | head -1)
    echo $msg | cowsay -n -f $speaker | lolcat
fi
# }}}
