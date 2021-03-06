# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
export ZSH_CUSTOM=${ZSH}/custom/plugins
export EDITOR='nvim'
export KEYTIMEOUT=1
bindkey -v

export HOMEBREW_GITHUB_API_TOKEN="3c34e50501fc8ecb324523fd8f66a1ba4348418f"

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

# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#git
plugins=(git gitfast jira zsh-syntax-highlighting zsh-autosuggestions)
# User configuration

source $ZSH/oh-my-zsh.sh

# Completion for tmuxinator
source ~/.local/bin/tmuxinator.zsh

# Personal Aliases

alias aliasall="{ alias; git aliases; } | sort"
alias bower='noglob bower' # Fixes zsh: `no matches found: package-at-version#2.3.4`
alias cop="rubocop -a"
alias ntb="cd ~/projects/NTBackend"
alias ntf="cd ~/projects/NTFrontend"
alias tmux="TERM=screen-256color-bce tmux"
alias es="ember server -e rails"

# git aliases

alias git=hub

alias gs="git status -s"

alias gsh="git show --color-words"

alias gb="git checkout -"
alias gccm="git checkout ${CURRENT_MASTER}"
alias gcoo="git checkout --ours"
alias gcot="git checkout --theirs"
alias gcd="git checkout --"
alias gcda="git checkout -- ."

alias gr1="git reset HEAD^"
alias gr2="git reset HEAD^^"
alias gr="git reset"
alias grh="git reset --hard"
alias grh1="git reset --hard HEAD^"
alias grh1="git reset --hard HEAD^^"
alias gu="git reset --hard"
alias gunstage="git reset HEAD"

alias grc="git rebase --continue"
alias grcm="git rebase ${CURRENT_MASTER}"
alias grl="git rebase -i head~`(git log --oneline head --not master | wc -l | awk '{print $1}')`"
alias grm="git rebase master"

alias gdc="git diff --cached"
alias gdf="git diff"

# git head behind
alias ghb="git log --oneline --decorate head --not origin/$(git_current_branch) | wc -l | tr -d ' '"
alias gle="git log --oneline --decorate"
alias gll="git log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"
# git review master
alias grevm="git log --oneline --decorate --no-merges origin/master --not master --author='^((?!wojtek).*)$'"
alias gtags="git log --tags --simplify-by-decoration --pretty='format:%ai %d'"

alias gbcopy="git branch --move $(git_current_branch)-copy && git reset --hard origin/master"
alias ggfpush='git push --force-with-lease origin $(git_current_branch)'
# The number of commits that are not in remote tracking branch
# Helpful when reviewing commits in reverse order before push
alias grevcm="git log --oneline --decorate --no-merges origin/${CURRENT_MASTER} --not ${CURRENT_MASTER} --author='^((?!wojtek).*)$'"

alias gbc="git_current_branch"
alias gpr="hub pull-request"
alias lasttag="git describe --tags --abbrev=0"
alias grlog="git reflog"

# rails aliases

alias rc="bundle exec rails console"
alias rdc="rake db:create"
alias rdd="rake db:drop"
alias rds="rake db:seed"
alias rdm="rake db:migrate"
alias rs="bundle exec rails server"

alias ctags="`brew --prefix`/bin/ctags"
alias dfi="cd ~/dotfiles"
alias nv="nvim"

setopt no_global_rcs
setopt HIST_IGNORE_SPACE

export PATH=~/.local/bin:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.5

export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

source ~/.iterm2_shell_integration.`basename $SHELL`

source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(rbenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
