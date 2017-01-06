export rvm_recommended_ruby='ruby-2.3'

#Path to your oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

alias dotfiles='cd ~/dotfiles'

alias b='bundle'
alias bi='bundle install'
alias be='bundle exec'

alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
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
alias t="touch"
alias tr="tree -a -C -I '.git|.DS_Store' | less"

alias v='vim'
alias rs='clear && rails s -p 5000'
alias rc='clear && rails console'
alias j='clear && jobs -l'
alias p='clear && pry '
alias ps='clear && ps aux'
alias psg='ps aux | grep'
alias psgu='ps aux | grep unicorn'
alias psgn='ps aux | grep nginx'

# alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias e='emacs '

alias tlf='tail -f'
alias reindex='ctags -R .'

# spot.im
alias spot='/Users/yaronwittenstein/spot.im/'
alias learn='/Users/yaronwittenstein/learn/'
alias code='/Users/yaronwittenstein/learn/'
alias dev='cd /Users/yaronwittenstein/spot.im && tmuxinator start spotim'
alias devkill='tmux kill-session -t spotim'
alias devk='tmux kill-session -t spotim'
alias killdev='tmux kill-session -t spotim'
alias kdev='tmux kill-session -t spotim'

# personal
alias yaron='/Users/yaronwittenstein/'
alias dropbox='/Users/yaronwittenstein/Dropbox/'
alias work='/Users/yaronwittenstein/Dropbox/work/'
alias code='/Users/yaronwittenstein/Dropbox/work/code/'
alias 30-days-of-elixir='/Users/yaronwittenstein/elixir-demos/30-days-of-elixir'
alias desktop='/Users/yaronwittenstein/Desktop'

# sudo
alias ss='sudo'
alias s='sudo'

# gem
alias gemb='gem build *.gemspec'
alias gemu='gem uninstall'
alias  fp="(rm -f *.gem) && gem build *.gemspec && gem inabox *.gem"

alias gi='sudo gem install –no-ri –no-rdoc'
alias gemi='sudo gem install –no-ri –no-rdoc'
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
alias glg="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# tmux
alias tmuxinator='TERM=xterm-256color tmuxinator'
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
# bindkey '\C-z' edit-command-line

# the first Ctrl+z will suspend the currently foregrounded program
# the second Ctrl+z will foreground the most recently suspended program
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0  ]]; then
    zle redisplay
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '\C-z' fancy-ctrl-z

#By deafult, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

export EDITOR=vim

ZSH_THEME="aussiegeek"

plugins=(dir-circle dirhistory
        ruby bundler gem rvm
        brew
        osx
        git gitfast
        redis-cl
        sudo zsh-syntax-highlighting last-working-dir)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Users/yaronwittenstein/.rvm/gems/ruby-2.2.1/bin:$PATH

unsetopt BEEP                # No beeps on error
unsetopt HIST_BEEP           # No history beeps
unsetopt LIST_BEEP           # No list beeps

# By default, ^S freezes terminal output and ^Q resumes it.
unsetopt FLOW_CONTROL
stty -ixon -ixoff 2>/dev/null # really, no flow control

# If a pattern for filename generation has no matches, delete the pattern from the argument list;
# do not report an error unless all the patterns in a command have no matches
setopt null_glob

source ~/.profile
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/yaronwittenstein/Desktop/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/yaronwittenstein/Desktop/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/yaronwittenstein/Desktop/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/yaronwittenstein/Desktop/google-cloud-sdk/completion.zsh.inc'
fi
