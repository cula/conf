source /opt/local/etc/profile

# history
HISTFILE=~/.zsh_history
SAVEHIST=1000000
HISTSIZE=1000000
setopt share_history
setopt inc_append_history
bindkey '^R' history-incremental-search-backward

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"

zplug "zsh-users/zsh-history-substring-search"

zplug "zsh-users/zsh-syntax-highlighting"
zplug "srijanshetty/zsh-pip-completion"

zplug "lukechilds/zsh-nvm"

# Supports oh-my-zsh plugins and the like
# zplug "plugins/git",   from:oh-my-zsh
# zplug "plugins/git",   from:oh-my-zsh, if:"which git"
# zplug "plugins/git-extras", from:oh-my-zsh, if:"which git"
# zplug "plugins/tmuxinator", from:oh-my-zsh
# zplug "plugins/gnu-utils", from:oh-my-zsh
# zplug "plugins/web-search", from:oh-my-zs

# For SSH, starting ssh-agent is annoying
# zplug "plugins/ssh-agent", from:oh-my-zsh
# zplug "rupa/z"
#
# Themes : This one works
# zplug "houjunchen/solarized-powerline"
# ZSH_THEME="solarized-powerline"
#


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# poerline
source /opt/local/Library/Frameworks/Python.framework/Versions/Current/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
