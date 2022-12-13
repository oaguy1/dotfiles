## Global Definitions (Fedora)
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

## HISTORY

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


## PIPE

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


## PS1

# Largely lifted from link below
# https://unix.stackexchange.com/questions/360545/tmux-not-colorizing-ps1-prompt

git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

PS1='\[\033[01;31m\]\t \[\033[01;32m\]\u \[\033[01;36m\]\h \[\033[01;34m\]\w \[\033[01;33m\]$(git_branch)\[\033[00m\]\n\$ '

## ALIASES

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more useful aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mkctl="microk8s kubectl"
alias newpass='date +%s | md5sum | base64 | head -c 32 | xargs echo'
alias tls='tmux list-sessions'
alias ta='tmux attach-session -t'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


## ENV VARS

export VISUAL=vim
export EDITOR=$VISUAL

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

## Third Party Integrations
# If Rust is installed, initialize cargo
if [ -f $HOME/.cargo/env ]; then
  source "$HOME/.cargo/env"
fi

# Add terraform bash completion, if terraform is installed
if [ -f /usr/bin/terraform ]; then
  complete -C /usr/bin/terraform terraform
fi

## Added from OpenSuSE
test -s ~/.alias && . ~/.alias || true
