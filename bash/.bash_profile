#coding=utf8

source /opt/local/etc/profile

# bash auto completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh  ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

# Fix not autocomplete command after typein sudo
complete -cf sudo

#export PS1="\[\e[36;1m\]\u@\[\e[31;1m\]\h\[\e[35;1m\]\t\[\e[32;1m\]\w\[\e[33;1m\]\$\[\e[0m\]"
alias ls="ls -G"

# for history
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"

# powerline
. /opt/local/Library/Frameworks/Python.framework/Versions/Current/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
