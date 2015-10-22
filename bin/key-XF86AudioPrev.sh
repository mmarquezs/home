#!/usr/bin/env bash

process_running() {
    [[ `pgrep -f $1` ]] && return 0 || return 1
}

#tune play $(tune list | grep "`tune show | rev | cut -d '(' -f 2- | rev | sed -e 's/[[:space:]]*$//'`" | cut -d '$' -f 2 | cut -d '[' -f 2 | cut -d ']' -f 1)

if process_running 'radiotray';
then
    if [[ `tune show | grep '(not playing)'` ]]
    then
	tune play $(($(tune list | grep "`tune show | rev | cut -d '(' -f 2- | rev | sed -e 's/[[:space:]]*$//'`" | cut -d '$' -f 2 | cut -d '[' -f 2 | cut -d ']' -f 1)-1)) > /dev/null
    else
	tune stop > /dev/null
	tune play $(($(tune list | grep "`tune show | rev | cut -d '(' -f 2- | rev | sed -e 's/[[:space:]]*$//'`" | cut -d '$' -f 2 | cut -d '[' -f 2 | cut -d ']' -f 1)-1)) > /dev/null

    fi
    
fi 
   
