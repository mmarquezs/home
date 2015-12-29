#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HOSTNAME
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
