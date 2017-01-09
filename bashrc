export EDITOR=vim
umask 002

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTTIMEFORMAT='%F %T '

# force commands entered on multiple lines to appear on a single line
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# PS1='\[\033[0;33m\]--\[\033[00m\]\n\[\033[0;34m\]\u@\h:\w\[\033[00m\]\n\[\033[0;33m\]❯\[\033[00m\] '

# color prompt
# PS1='\n\[\033[0;34m\]\w\[\033[00m\]\n\[\033[0;33m\]❯\[\033[00m\] '

# b&w prompt
PS1='\[\e[1;30m\]\n\w\n❯ \[\e[0m\]'

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'
    ;;
  *)
    ;;
esac

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

# some more ls aliases
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi

if uname | grep -q Darwin; then
  alias gvim='mvim'
fi

function g
{
  gvim --remote-silent $@
}

svn() {
  if [[ ( x"$1" == xdiff  || x"$1" == xdi ) && ( -t 1 ) ]]; then
    $(which svn) "$@" | colordiff | less -RFX
  else
    $(which svn) "$@"
  fi
}

function vimfind
{
  find . -name $@ -exec vim {} +
}

# tab competion for hosts in .ssh/config
if [ -f $HOME/.ssh/config ]; then
  complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -s $HOME/.nvm/nvm.sh ]]      && source $HOME/.nvm/nvm.sh

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

. <( npm completion )

export PATH=$HOME/bin
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$JAVA_HOME/bin

if [ -f $PWD/.bashrc.local ]; then
  source $PWD/.bashrc.local
fi

if [ -f $PWD/.env.local ]; then
  source $PWD/.env.local
fi

# java vars
export JAVA_HOME=$(/usr/libexec/java_home)
export ECLIPSE_HOME=$HOME/eclipse
