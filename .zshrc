# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow-avh ssh-agent composer)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.composer/vendor/bin" ] ; then
    PATH="$HOME/.composer/vendor/bin:$PATH"
fi

PATH="$HOME/.node/bin:$PATH:./vendor/bin"

export GNOME_KEYRING_CONTROL=$XDG_RUNTIME_DIR/keyring

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias todo="find . -name '*php' -type f | xargs grep -Ei '(todo|fixme|die|var_dump|hack)'"
alias fphp="find . -name '*php' -type f | xargs grep -E"
alias fyaml="find . -name '*yaml' -type f | xargs grep -E"
alias fcss="find . -name '*css' -type f | xargs grep -E"
alias fjs="find . -name '*js' -type f | xargs grep -E"
alias fsass="find . -name '*scss' -type f | xargs grep -E"
alias fpp="find . -name '*pp' -type f | xargs grep -E"
alias fpo="find . -name '*po' -type f | xargs grep -E"
alias fall="find . -type f | xargs grep -E"

alias vms='VBoxManage list runningvms'

DEFAULT_USER='__user__'

eval `dircolors $HOME/.dircolors`
source ~/.fzf.zsh

timestamp() {
	date +"%Y%m%d%H%M%S"
}

# Timestamp to date helper
t2d() {
	date -d @$1
}

# Vagrant alias
alias vs='vagrant ssh'
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vpro="vagrant provision"
alias vc="vs -c"
alias vip="vs -c 'cat /etc/motd | grep -F Host: | egrep -o [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'"

source "$HOME/.antigen/antigen.zsh"

antigen-use oh-my-zsh
antigen-bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

antigen-apply

export NVM_DIR="/home/__user__/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
