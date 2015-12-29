# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/bin:$HOME/.gem/ruby/2.1.0/bin:/usr/local/bin:$HOME/bin:$HOME/.gem/ruby/2.2.0/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.go/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export GOPATH="$HOME/.go"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
DEFAULT_USER="marcmarquez"
alias repairkeyboard="setxkbmap $(setxkbmap -query | grep "^layout:" | awk -F ": *" '{print $2}') && killall synergyc && synergyc 192.168.1.40" 
alias emacsd="nohup emacsclient -ca emacs> /dev/null 2>&1 &"
#alias emacs="emacs -nw"
alias beep="aplay --quiet /usr/share/sounds/speech-dispatcher/test.wav"
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
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
antigen bundle Lokaltog/powerline powerline/bindings/zsh
# Tell antigen that you're done.
antigen apply



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


# bindkey -v

# bindkey "^P" vi-up-line-or-history
# bindkey "^N" vi-down-line-or-history

# bindkey "^[[1~" beginning-of-line   # Home
# bindkey "^[[4~" end-of-line         # End
# bindkey '^[[2~' beep                   # Insert
# bindkey '^[[3~' delete-char            # Del
# bindkey '^[[5~' vi-backward-blank-word # Page Up
# bindkey '^[[6~' vi-forward-blank-word  # Page Down




# bindkey '^P' up-history
# bindkey '^N' down-history
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word
# bindkey '^r' history-incremental-search-backward

# # function zle-line-init zle-keymap-select {
# #     VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
# #     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
# #     zle reset-prompt
# # }

# # zle -N zle-line-init
# # zle -N zle-keymap-select
# export KEYTIMEOUT=1
