# Path to your oh-my-zsh installation.
export ZSH=/Users/wojtekryrych/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-prompt gitignore.plugin)

# User configuration

source $ZSH/oh-my-zsh.sh

# Personal Aliases

alias=ctg="ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths) 2>/dev/null"
alias git=hub
alias gpr="hub pull-request"
alias gcoo="git checkout --ours"
alias gcot="git checkout --theirs"
alias grm="git rebase master"

# Fixes zsh: `no matches found: package-at-version#2.3.4`
alias bower='noglob bower'

PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin:$HOME/.local/bin # Add RVM to PATH for scripting
export PATH=./node_modules/.bin:$PATH

# List processes related to rails
pgr() {
  for x in spring rails phantomjs zeus; do
    pgrep -fl $x;
  done
}

# Kill processes related to rails
pgk() {
  for x in spring rails phantomjs zeus; do
    pkill -fl $x;
  done
}
