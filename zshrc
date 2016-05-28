# Path to your oh-my-zsh installation.
export ZSH=/Users/wojtekryrych/.oh-my-zsh
export EDITOR='nvim'
export KEYTIMEOUT=1
bindkey -v

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-prompt gitignore.plugin zsh-syntax-highlighting z)

# User configuration

source $ZSH/oh-my-zsh.sh

# Completion for tmuxinator
source ~/.local/bin/tmuxinator.zsh

# Personal Aliases

alias aliasall="{ alias; git aliases; } | sort"
alias bower='noglob bower' # Fixes zsh: `no matches found: package-at-version#2.3.4`

# git aliases

alias gcoo="git checkout --ours"
alias gcot="git checkout --theirs"
alias ggfpush='git push --force-with-lease origin $(git_current_branch)'
alias git=hub
alias gpr="hub pull-request"
alias grl="git rebase -i head~`(git le head --not master | wc -l | awk '{print $1}')`"
alias gle="git log --oneline --decorate"
# remaps git branch to g co --
alias gb="git checkout -"

# git head behind
# The number of commits that are not in remote tracking branch
# Helpful when reviewing commits in reverse order before push
alias ghb="git le head --not origin/$(git_current_branch) | wc -l | awk '{ print $1 }'"

alias grm="git rebase master"
alias gs="git s"
alias gdf="git diff"
alias gdc="git diff --cached"

alias ntb="cd ~/projects/NTBackend"
alias ntf="cd ~/projects/NTFrontend"
alias tmux="TERM=screen-256color-bce tmux"

# rails aliases

alias rc="rails console"
alias rdc="rake db:create"
alias rdd="rake db:drop"
alias rdm="rake db:migrate"
alias rs="rails server"

PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin:$HOME/.local/bin # Add RVM to PATH for scripting
export PATH=./node_modules/.bin:$PATH

export NVM_DIR="/Users/wojtekryrych/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

eval "$(thefuck --alias kuzwa)"
