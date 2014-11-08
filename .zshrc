#Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

alias dotfiles='cd ~/dotfiles'

# Initialize completion
autoload -U compinit
compinit

# colorize terminal
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-z' edit-command-line

#By deafult, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'


alias yaron='/Users/yaronwittenstein/'
alias dropbox='/Users/yaronwittenstein/Dropbox/'

alias work='/Users/yaronwittenstein/Dropbox/work/'
alias code='/Users/yaronwittenstein/Dropbox/work/code/'

# spot.im
alias spot='/Users/yaronwittenstein/spot.im/'
alias spotserver='/Users/yaronwittenstein/spot.im/server_v3'
alias spotchef='/Users/yaronwittenstein/spot.im/chef'
alias hotspot='/Users/yaronwittenstein/spot.im/admin'
alias spotlandingpage='/Users/yaronwittenstein/spot.im/landing-page'
alias spotfrontend='/Users/yaronwittenstein/spot.im/frontend/'
alias spotpixeldemo='/Users/yaronwittenstein/spot.im/spotim-pixel-influxdb'
alias sso-examples='/Users/yaronwittenstein/spot.im/sso-examples'

alias dev='spotserver; tmux a -t dev'

alias desktop='/Users/yaronwittenstein/Desktop'
alias rubytapas='/Users/yaronwittenstein/Dropbox/work/code/demos/ruby/practice/rubytapas'
alias railscasts='/Users/yaronwittenstein/Dropbox/work/code/demos/ruby/practice/railscasts'

export EDITOR=vim

# git aliases
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gac='gaa; gc'
alias gco='git checkout'
alias gcod='git checkout develop'
alias gcom='git checkout master'
alias gcob='git checkout -b'
alias gp='git push origin HEAD'
alias gl='git pull origin'
alias gb='git branch'
alias gb-dm='git branch -D master'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gs='git status -sb'
alias gst='git stash'
alias gsq='git rebase -i'
alias gd='git diff'
alias gm='git merge'
alias gmm='git merge master'
alias gmd='git merge develop'
alias grhh='git reset HEAD --hard'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# tmux
alias tls='tmux ls'

# ssh
alias ss='ssh'
alias s='ssh'
alias sconfig='vim ~/.ssh/config'
alias sshconfig='vim ~/.ssh/config'

# conf files
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias tmuxconf='vim ~/.tmux.conf'

ZSH_THEME="aussiegeek"

plugins=(git osx ruby rake rspec rails gem rvm npm node coffee bundler brew pow redis-cli knife tmux tmuxinator sublime)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/Users/yaronwittenstein/.rvm/gems/ruby-2.0.0-p247/bin:/Users/yaronwittenstein/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/yaronwittenstein/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/yaronwittenstein/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# docker
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/yaronwittenstein/.boot2docker/certs/boot2docker-vm
alias dl='docker ps -l -q'

# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# that those keys can be used for other things.
unsetopt flowcontrol
# Run Selecta in the current working directory, appending the selected path, if
# any, to the current command.
function insert-selecta-path-in-command-line() {
    local selected_path
    # Print a newline or we'll clobber the old prompt.
    echo
    # Find the path; abort if the user doesn't select anything.
    selected_path=$(find * -type f | selecta) || return
    # Append the selection to the current command buffer.
    eval 'LBUFFER="$LBUFFER$selected_path"'
    # Redraw the prompt since Selecta has drawn several new lines of text.
    zle reset-prompt
}

# create the zle widget
zle -N insert-selecta-path-in-command-line
# Bind the key to the newly created widget
bindkey "^S" "insert-selecta-path-in-command-line" 
