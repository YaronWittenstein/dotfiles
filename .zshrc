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
alias r='clear && rails s -p 5000'
alias rc='clear && rails console'
alias j='clear && jobs -l'
alias p='clear && pry '
alias ps='clear && ps aux'
alias z='clear && zeus start'

alias tlf='tail -f'

alias reindex='ctags -R .'

alias yaron='/Users/yaronwittenstein/'
alias dropbox='/Users/yaronwittenstein/Dropbox/'

alias work='/Users/yaronwittenstein/Dropbox/work/'
alias code='/Users/yaronwittenstein/Dropbox/work/code/'

# spot.im
alias spot='/Users/yaronwittenstein/spot.im/'
alias spotserver='/Users/yaronwittenstein/spot.im/server_v3'
alias spotchef='/Users/yaronwittenstein/spot.im/chef'
alias hotspot='/Users/yaronwittenstein/spot.im/hotspot'
alias spotlandingpage='/Users/yaronwittenstein/spot.im/landing-page'
alias spotfrontend='/Users/yaronwittenstein/spot.im/frontend/'
alias spotpixeldemo='/Users/yaronwittenstein/spot.im/spotim-pixel-influxdb'
alias sso-examples='/Users/yaronwittenstein/spot.im/sso-examples'
alias influxible='/Users/yaronwittenstein/spot.im/influxible'
alias spotalytics='/Users/yaronwittenstein/spot.im/spotalytics'
alias spotim-devops-utils='/Users/yaronwittenstein/spot.im/spotim-devops-utils'

alias dev='spotserver; tmux a -t dev'

alias desktop='/Users/yaronwittenstein/Desktop'
alias rubytapas='/Users/yaronwittenstein/Dropbox/work/code/demos/ruby/practice/rubytapas'
alias railscasts='/Users/yaronwittenstein/Dropbox/work/code/demos/ruby/practice/railscasts'

# gem
alias gemp='fury push *.gem'
alias gemb='gem build *.gemspec'
alias  fp='rm *.gem && gem build *.gemspec && fury push *.gem'

alias gi='gem install '
alias gu='gem uninstall '
alias gl='gem list'

# git aliases
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
alias tls='tmux ls'

# ssh
alias ss='ssh'
alias s='ssh'
alias sconfig='vim ~/.ssh/config'
alias sshconfig='vim ~/.ssh/config'
alias hosts='sudo vim /etc/hosts'
alias known_hosts='vim ~/.ssh/known_hosts'

# dotfiles
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias tmuxconf='vim ~/.tmux.conf'

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
        docker knife cap vagran
        #vi-mode
        tmux tmuxinator sublime
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
