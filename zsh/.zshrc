source /opt/local/etc/profile

# history
HISTFILE=~/.zsh_history
SAVEHIST=1000
HISTSIZE=1000
setopt share_history
setopt inc_append_history
setopt hist_ignore_all_dups
bindkey '^R' history-incremental-search-backward

zmodload zsh/zprof
zmodload zsh/datetime

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

zplug "srijanshetty/zsh-pip-completion"

# This plugin support nvm lazy load
# export NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"

# oh-my-zsh plugins
zplug "plugins/z", from:oh-my-zsh

# fzf
# Caution! This need extra-installation
zplug "~/.fzf", from:local
FZF_TMUX=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zplug "uvaes/fzf-marks"

zplug "andrewferrier/fzf-z"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# powerline
source /opt/local/Library/Frameworks/Python.framework/Versions/Current/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
