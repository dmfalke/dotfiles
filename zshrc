# set interactive comments
set -k
umask 002
unsetopt correct
setopt extended_glob
bindkey "^R" history-incremental-search-backward

source secrets

# Customize to your needs...
# export PATH=/usr/local/bin:/usr/local/sbin:/Users/dfalke/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/dfalke/.rvm/bin:/Users/dfalke/.rvm/bin
export EDITOR=vim

export GREP_OPTIONS='--color --exclude-dir=.svn --exclude-dir=.git'

# java vars
export JAVA_HOME=$(/usr/libexec/java_home)
export CATALINA_HOME=$HOME/tools/tomcat

export ECLIPSE_HOME=$HOME/eclipse

# ruby lib
export RUBYLIB=$HOME/lib/ruby

# Customize to your needs...
# export PATH=/usr/local/bin:/usr/local/sbin:/Users/dfalke/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/dfalke/.rvm/bin:/Users/dfalke/.rvm/bin
export PATH=
export PATH=$PATH:$HOME/bin
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

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(/$HOME/.zsh/completion $fpath)

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="lambda"
# ZSH_THEME="avit"
ZSH_THEME="my-bureau"
# ZSH_THEME="norm"

# Example aliases
alias zshconfig="mvim ~/.zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(vi-mode git npm)
plugins=(git npm svn)

source $ZSH/oh-my-zsh.sh

PERL_MB_OPT="--install_base \"/Users/dfalke/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/dfalke/perl5"; export PERL_MM_OPT;

export PATH="$HOME/.yarn/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . $HOME/.rvm/scripts/rvm
[[ -s "$HOME/.nvm/nvm.sh" ]]      && . $HOME/.nvm/nvm.sh
[[ -f $HOME/.aliases ]]           && . $HOME/.aliases
[[ -s "$PWD/.env.local" ]]        && . $PWD/.env.local
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
