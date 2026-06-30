#!/bin/bash
# Make shell history more useful across terminal sessions.
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND:-:}"

# Aliases I use often while working in cs131.
alias ll='ls -alF --group-directories-first'
alias gs='git status --short --branch'
alias ..='cd ..'

# Only create CS131 shortcuts when the repository exists on this machine.
if [ -d "$HOME/cs131" ]; then
    	 export CS131_HOME="$HOME/cs131"
         alias cs131='cd "$CS131_HOME"'
         alias ws4='cd "$CS131_HOME/ws4"'
fi

# Create a directory and immediately move into it
 mkcd () {
	 if [ "$#" -ne 1 ]; then
		 echo "Usage: mkcd DIRECTORY" >&2
                 return 2
         fi
	 mkdir -p -- "$1" && cd -- "$1"
}

# Jump to the root of the current Git repository.
groot () {
      local root
      root=$(git rev-parse --show-toplevel 2>/dev/null) || {
      echo "Not inside a Git repository" >&2
      return 1
	}

cd -- "$root"
}

