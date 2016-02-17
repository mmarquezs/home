# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize themes)
source $ZSH/oh-my-zsh.sh
# User configuration
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
[ -d "/usr/bin" ] && PATH="/usr/bin:$PATH"
[ -d "/opt/android-sdk/platform-tools" ] && PATH="/opt/android-sdk/platform-tools:$PATH"
[ -d "/usr/bin/site_perl/" ] && PATH="/usr/bin/site_perl/:$PATH"
[ -d "/usr/bin/vendor_perl/" ] && PATH="/usr/bin/vendor_perl/:$PATH"
[ -d "/usr/bin/core_perl/" ] && PATH="/usr/core_perl/:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.go/bin" ] && PATH="$HOME/.go/bin:$PATH"

export HOST			# Added so it allows i3bang to set a configuration or an other based on the hostname. 
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GOPATH="$HOME/.go"
DEFAULT_USER="marcmarquez"
alias repairkeyboard="setxkbmap $(setxkbmap -query | grep "^layout:" | awk -F ": *" '{print $2}') && killall synergyc && synergyc 192.168.1.40" # Useful when using synergy since sometimes it changes the keyboard layout for some strange reason.
alias emacsd="nohup emacsclient -ca emacs> /dev/null 2>&1 &" # To start or attach to a daemon emacs.
alias beep="aplay --quiet /usr/share/sounds/speech-dispatcher/test.wav" # Useful when doing cp, mv etc,.. of a big file and you want an alert when it has finished. Simply add it at the end, "cp foo bar && beep"
alias t="todo -d $HOME/.todo.cfg"
alias tw="todo | grep @work"
alias lgen="python -c 'import sys;import libgenapi;l=libgenapi.Libgenapi(\"http://gen.lib.rus.ec/\");print(l.search(sys.argv[1]))'"
alias kvm="qemu-system-x86_64 -enable-kvm -cpu host"

export TODOTXT_DEFAULT_ACTION=ls
export EDITOR="nohup emacsclient -ca emacs> /dev/null 2>&1 &"
export ALTERNATE_EDITOR="vim"
source ~/.zshrc.d/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle fasd
antigen bundle last-working-dir
antigen bundle command-not-found

# Syntax highlighting bundle.
#antigen bundle tarruda/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
antigen bundle Lokaltog/powerline powerline/bindings/zsh
# Tell antigen that you're done.
antigen apply

# Search history based on what I have typed.
bindkey -M vicmd "k" history-beginning-search-backward
bindkey -M vicmd "j" history-beginning-search-forward
###################
#VIM SETTINGS
###################
####
#Hack
#####
git_custom_status() {
    local cb=$(current_branch)
    if [ -n "$cb" ]; then
	echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}
#####
# Bindings
#####

bindkey "\C-w" kill-region
bindkey "\e^?" backward-kill-word

# Vi Mode
bindkey -v
bindkey '^R' history-incremental-search-backward

##
#ZSH OPTIONS (From: https://github.com/aaronbieber/dotfiles/blob/master/configs/zshrc )
##
setopt autolist       # Display completion candidates immediately.
setopt cdablevars     # When an argument should be a dir but is not one,
                      # expand it as if it started with ~ (see below).
setopt autonamedirs   # Any parameter that is set to an abosolute directory
                      # name automatically becomes a name for that directory
                      # in the form ~param.
setopt histignoredups # Do not record a command in the history if it is a
                      # duplicate of the previous one.
setopt listtypes      # When listing files that are possible completions,
                      # indicate their types with a trailing character.
setopt nolistbeep     # No bell on ambiguous completion!!

eval $(ssh-agent)
