#coding=utf8

export PATH=/opt/local/bin/python_bin:/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export EDITOR=/opt/local/bin/vim

# bash auto completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh  ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

# autojump
if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
	. /opt/local/etc/profile.d/autojump.sh
fi

#export PS1="\[\e[36;1m\]\u@\[\e[31;1m\]\h\[\e[35;1m\]\t\[\e[32;1m\]\w\[\e[33;1m\]\$\[\e[0m\]"
alias ls="ls -G"

# Fix not autocomplete command after typein sudo
complete -cf sudo

# Fix Chinese Character display
export LC_ALL="zh_CN.UTF-8"

# powerline
. /opt/local/Library/Frameworks/Python.framework/Versions/Current/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
