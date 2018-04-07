export rvm_recommended_ruby='ruby-2.3.1'

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
alias p="pry"
alias tr="tree -a -C -I '.git|.DS_Store' | less"

alias v='vim'
# alias vim='vim'
alias j='clear && jobs -l'

# alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias e='emacs --no-splash'

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
alias desktop='/Users/yaronwittenstein/Desktop'

# sudo
# alias s='sudo'

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
alias glg="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# elixir
alias mt='mix test'
alias mdeps='mix deps.get; mix deps.compile'
alias mr='mix run --no-halt'

# rust
alias cb='cargo build'
alias cr='cargo run'
alias ct='cargo test'

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

plugins=(dircircle
        dirhistory
        cp
        cargo
        go
        ruby
        lein
        bundler
        gem
        rvm
        mix
        rust
        brew
        osx
        gem
        git
        gitfast
        git-remote-branch
        redis-cl
        vi-mode
        last-working-dir
        zsh-autosuggestions
        zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# elixir/erlang history
export ERL_AFLAGS="-kernel shell_history enabled"

# go
export GOPATH=$HOME/go

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

alias ls='exa --long'

# elasticsearch
elasticsearch='elasticsearch -Des.insecure.allow.root=true'

# fzf (fuzzy finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_COMPLETION_TRIGGER=';'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Users/yaronwittenstein/.rvm/gems/ruby-2.3.1/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
