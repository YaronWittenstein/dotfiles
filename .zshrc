#Path to your oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

alias dotfiles='cd ~/dotfiles'

alias b='bundle'
alias bi='bundle install'
alias be='bundle exec'

alias ..='cd ..'
alias ...='cd ../..'
alias c='cd'
alias cd..='cd ..'
alias cd.='cd ..'
alias c..='cd..'
alias c.='cd..'
alias df='df -h'
alias dh='dh -h -c'
alias ls='ls -alG'
alias l='ls'
alias ll='ls'
alias grep='grep --color'
alias t="tree -a -C -I '.git|.DS_Store' | less"

alias v='vim'
alias rs='clear && rails s -p 5000'
alias rc='clear && rails console'
alias j='clear && jobs -l'
alias p='clear && pry '
alias e='elixir '
alias ps='clear && ps aux'
alias psg='ps aux | grep'
alias psgu='ps aux | grep unicorn'
alias psgn='ps aux | grep nginx'

# zeus
alias zs='clear && zeus start'
alias zc='clear && zeus console'

alias tlf='tail -f'

alias reindex='ctags -R .'

alias yaron='/Users/yaronwittenstein/'
alias dropbox='/Users/yaronwittenstein/Dropbox/'

alias work='/Users/yaronwittenstein/Dropbox/work/'
alias code='/Users/yaronwittenstein/Dropbox/work/code/'

# spot.im
alias spot='/Users/yaronwittenstein/spot.im/'
alias spotim='/Users/yaronwittenstein/spot.im/'

alias 30-days-of-elixir='/Users/yaronwittenstein/elixir-demos/30-days-of-elixir'

alias desktop='/Users/yaronwittenstein/Desktop'
alias rubytapas='/Users/yaronwittenstein/Dropbox/work/code/demos/ruby/practice/rubytapas'
alias railscasts='/Users/yaronwittenstein/Dropbox/work/code/demos/ruby/practice/railscasts'

# sudo
alias ss='sudo'
alias s='sudo'

# gem
alias gemp='fury push *.gem'
alias gemb='gem build *.gemspec'
alias gemu='gem uninstall'
alias  fp='rm *.gem && gem build *.gemspec && fury push *.gem'

alias gi='gem install '
alias gl='gem list'
alias gu='gem uninstall '
alias guall='for i in `gem list --no-versions`; do gem uninstall -aIx $i; done'

# git aliases
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gamend='git commit --amend'
alias gac='gaa; gc'
alias gco='git checkout'
alias gcod='git checkout develop'
alias gcom='git checkout master'
alias gcob='git checkout -b'
alias gp='git push origin HEAD'
alias gpf='git push origin HEAD -f'
alias gpom='git push origin master'
alias gl='git pull origin'
alias gb='git branch'
alias gb-dm='git branch -D master'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gs='git status -sb'
alias gst='git stash'
alias gsq='git rebase -i'
alias gd='git diff'
alias gds='git diff --stat=160,120'
alias gd1='git diff HEAD~1'
alias gdh1='git diff HEAD~1'
alias gm='git merge'
alias gmm='git merge master'
alias gmd='git merge develop'
alias grhh='git reset HEAD --hard'
alias grh='git reset HEAD --hard'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tls='tmux ls'
alias tmuxconf='vim ~/.tmux.conf'

# ssh
alias sconfig='vim ~/.ssh/config'
alias sshconfig='vim ~/.ssh/config'
alias hosts='sudo vim /etc/hosts'
alias known_hosts='vim ~/.ssh/known_hosts'

# vimrc, zshrc
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

# chef
# cookbooks
alias kcc='knife cookbook create '
alias kcu='knife cookbook upload '
alias kcd='knife cookbook delete '
alias kcl='knife cookbook list'
#roles
alias krl='knife role list'
alias krc='knife role create '

# docker
alias dl='docker ps -l -q'

# Initialize completion
autoload -U compinit
compinit

# colorize terminal
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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
        ruby bundler rake rspec rails zeus gem rvm pow
        npm node coffee brew
        redis-cl
        docker knife cap vagrant
        #vi-mode
        sublime
        osx sudo git zsh-syntax-highlighting last-working-dir
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

# source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/zsh/functions
