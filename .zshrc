#Path to your oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

# Initialize completion
autoload -U compinit
compinit

# colorize terminal
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-z' edit-command-line

#By deafult, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

export EDITOR=vim

ZSH_THEME="aussiegeek"

plugins=(dir-circle dirhistory
        git gitfast git-extras
        ruby bundler rake rspec rails zeus gem rvm pow
        npm node coffee brew
        redis-cl
        docker knife cap vagran
        #vi-mode
        tmux tmuxinator sublime
        osx sudo zsh-syntax-highlighting last-working-dir
        encode64 jsontools)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/.rvm/bin
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Users/yaronwittenstein/.rvm/gems/ruby-2.0.0-p353@spot.im/bin:$PATH

# docker
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/yaronwittenstein/.boot2docker/certs/boot2docker-vm

unsetopt BEEP                # No beeps on error
unsetopt HIST_BEEP           # No history beeps
unsetopt LIST_BEEP           # No list beeps

# By default, ^S freezes terminal output and ^Q resumes it. 
unsetopt FLOW_CONTROL
stty -ixon -ixoff 2>/dev/null # really, no flow control.

source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/zsh/functions
