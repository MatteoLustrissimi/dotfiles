# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.
# Modify the PS1 variable to adjust command prompt
# /u the username of the current user
# /h the hostname up to the first `.'
# /w the  current  working  directory, with $HOME abbreviated with a tilde (uses the value of the PROMPT_DIRTRIM variable)
# /$ if the effective UID is 0, a #, otherwise a $
# For more PS1 options see the PROMPTING section of `man 1 bash`
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

# No double entries in the shell history.
export HISTCONTROL="$HISTCONTROL erasedups:ignoreboth"

# Do not overwrite files when redirecting output by default.
set -o noclobber

# Vi mode requires an Esc key press to prefix very movement or edit, so it can be a bit awkward to learn this mode.
set -o vi

# Allow you to cd into directory merely by typing the directory name.
shopt -s autocd

# Disable Ctrl + S 
stty -ixon

# Wrap the following commands for interactive use to avoid accidental file overwrites.
rm() { command rm -i "${@}"; }
cp() { command cp -i "${@}"; }
mv() { command mv -i "${@}"; }

# Configure completion
complete -cf doas

# use alias
alias egrep='grep -E --colour=auto'
alias fgrep='grep -F --colour=auto'
alias grep='grep --colour=auto'
alias ls='ls --color=auto'
alias less='less --use-color'
alias ll='ls --color=auto --human-readable -l -all'
alias ytdl='youtube-dl -o "~/Downloads/ytdl.d/%(title)s.%(ext)s" -f bestvideo+bestaudio --merge-output-format mkv'
