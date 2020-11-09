# zmodload zsh/zprof

#Path to your oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

alias dotemacs='cd ~/dotemacs'
alias dotvim='cd ~/dotvim'
alias dotfiles='cd ~/dotfiles'

alias ..='cd ..'
alias ...='cd ../..'
alias k='clear'
alias c='xclip -selection clipboard'
alias p='xclip -selection clipboard -o'
alias cd..='cd ..'
alias cd.='cd ..'
alias ..='cd ..'
alias df='df -h'
alias dh='dh -h -c'
alias ls='exa --long'
alias ls='ls -la'
alias l='ls'
alias ll='ls'
alias grep='rg'
alias t="touch"
alias tr="tree -a -C -I '.git|.DS_Store' | less"

# alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias j='clear && jobs -l'

alias e='TERM=xterm-256color emacs -nw'

alias tlf='tail -f'
alias reindex='ctags -R .'

alias learn='/Users/yaronwittenstein/learn/'
alias code='/Users/yaronwittenstein/learn/'
alias hackerearth='/Users/yaronwittenstein/code/hackerearth/code-monk/basic-programming/io'

# Personal
alias yaron='/Users/yaronwittenstein/'
alias code='~/code/'
alias work='~/work'
alias sm='~/work/sm'
alias svm='~/work/sm/svm'
alias blog='~/code/yaronwittenstein'
alias newsletter='~/code/read-it-or-throw-it'
alias desktop='/Users/yaronwittenstein/Desktop'
alias cloc='loc'

# Ruby gems
alias gemb='gem build *.gemspec'
alias gemu='gem uninstall'
alias  fp="(rm -f *.gem) && gem build *.gemspec && gem inabox *.gem"

# Ruby bundler
alias b='bundle'
alias bi='bundle install'
alias be='bundle exec'


alias gi='sudo gem install –no-ri –no-rdoc'
alias gemi='sudo gem install –no-ri –no-rdoc'
alias gl='gem list'
alias gu='gem uninstall '
alias guall='for i in `gem list --no-versions`; do gem uninstall -aIx $i; done'

# git 
alias g='git'
alias ga='git add'
alias gc='git commit -m'
alias gamend='git commit --amend'
alias gac='gaa; gc'
alias gco='git checkout'
alias gcod='git checkout develop'
alias d='git checkout develop'
alias gcom='git checkout master'
alias m='git checkout master'
alias gcob='git checkout -b'
alias gp='git push origin HEAD'
alias gpf='git push origin HEAD -f'
alias gpom='git push origin master'
alias gl='git pull origin'
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
alias gfirst="git rev-list --max-parents=0 HEAD"
alias gnext="clear; ~/dotfiles/git/git-next.zsh"
alias gn="gnext; glog"
alias gcount="git log --pretty=format:'' | wc -l"

# k8s
alias kdesc="kubectl describe"
alias kdescp="kubectl describe pod"
alias kgp="kubectl get pods -o wide"
alias kls="kubectl get pods -o wide"
alias kpls="kubectl get pods -o wide"
alias kgn="kubectl get nodes -o wide"
alias knls="kubectl get nodes -o wide"
alias kgs="kubectl get services -o wide"
alias ksls="kubectl get services -o wide"
alias knsls="kubectl get namespace"
alias kdp="kubectl delete pod"
alias kds="kubectl delete service"
alias kdpa="kubectl delete --all pods"
# alias kdpa="argo delete --all; kubectl delete --all pods"
alias kc="kubectl create"
alias ka="kubectl apply"
alias kd="kubectl delete"
alias kx="kubectl exec"
alias klg="kubectl logs"
alias klog="kubectl logs"
# alias mk="minikube"
# alias h="helm"

# Rust cargo
alias rr='cargo +nightly build'
alias rt='cargo +nightly test -- --nocapture'
alias cb='cargo +nightly build'
alias cbr='cargo +nightly build --release'
alias cbw='cargo +nightly build --target wasm32-unknown-unknown --release'
alias cu='cargo +nightly update'
alias cr='cargo +nightly run'
alias ct='cargo +nightly test -- --nocapture'
alias ctd='cargo +nightly test --doc -- --nocapture'

# Golang
alias gt='go test'
alias gb='go build'
alias gr='go run'

GOTEST_PALETTE="magenta,white" # https://github.com/rakyll/gotest

# wasm
alias wasm2wat='~/wabt/build/wasm2wat'
alias wat2wasm='~/wabt/build/wat2wasm'

# ssh
alias sconfig='nvim ~/.ssh/config'
alias sshconfig='nvim ~/.ssh/config'
alias hosts='sudo nvim /etc/hosts'
alias known_hosts='nvim ~/.ssh/known_hosts'

# vimrc, zshrc
alias vimrc='e ~/.config/nvim/init.vim'
alias zshrc='e ~/.zshrc'

# init.el (emacs)
alias init.el='nvim ~/.emacs.d/init.el'

# docker
alias dp='docker pull'
alias di='docker image'
alias dc='docker container'
alias db='docker image build'
alias dib='docker image build'
alias dirm='docker image rm'
alias dirmf='docker image rm -f'
alias dils='docker image ls'
alias dls='docker container ls'
alias dcls='docker container ls'
alias dr='docker run -it --rm'
alias dk='docker kill'
alias drm='docker rm'
alias drmf='docker rm -f'

# Initialize completion
autoload -Uz compinit
compinit -C

# colorize terminal
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line

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

# By deafult, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

export EDITOR='TERM=xterm-256color emacs -nw'

# colors
export TERM="xterm-256color"

ZSH_THEME="aussiegeek"

plugins=(dirhistory
        docker
        cp
        cargo
        golang
        ruby
        bundler
        rbenv
        gem
        mix
        rust
        brew
        osx
        gem
        git
        vi-mode
        last-working-dir)

source $ZSH/oh-my-zsh.sh

# elixir/erlang history
export ERL_AFLAGS="-kernel shell_history enabled"

unsetopt BEEP                # No beeps on error
unsetopt HIST_BEEP           # No history beeps
unsetopt LIST_BEEP           # No list beeps

# By default, ^S freezes terminal output and ^Q resumes it.
unsetopt FLOW_CONTROL
stty -ixon -ixoff 2>/dev/null # really, no flow control

# If a pattern for filename generation has no matches, delete the pattern from the argument list;
# do not report an error unless all the patterns in a command have no matches
setopt null_glob

# elasticsearch
elasticsearch='elasticsearch -Des.insecure.allow.root=true'

# fzf (fuzzy finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_COMPLETION_TRIGGER=','
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

# [Shift-Tab] - move through the completion menu backwards
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/bin:$PATH

# CMake
export PATH=/Applications/CMake.app/Contents/bin:$PATH

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/go/bin

# Rust
export CARGO_HOME="$HOME/.cargo"
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library"
export PATH=$RUST_SRC_PATH:$PATH

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Python
PATH="~/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# enable zsh autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# SDL2
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# enable syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Cask (emacs)
export PATH="$HOME/.cask/bin:$PATH"

# wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"  # This loads wasmer

# Starship prompt
eval "$(starship init zsh)"

# k8s auto-completion
source <(kubectl completion zsh)

# zprof
