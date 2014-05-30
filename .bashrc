alias ls='ls -Gp'
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

_color () { echo -ne "\[\033[38;5;$1m\]"; }
NC="\[\033[0m\]"

export PS1="$(_color 22)[$NC$(_color 34)\u$NC$(_color 46)@$NC$(_color 118)\h$NC $(_color 190)\w$NC$(_color 226)]$NC$(_color 214)\$$NC "

source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
