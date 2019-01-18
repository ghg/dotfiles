#-*-Shell-Script-*-

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

source $ZSH/oh-my-zsh.sh

case `uname` in
  Darwin)
    export ANSIBLE_ROLES_PATH='/usr/local/etc/ansible/roles'
    export ANSIBLE_VAULT_PASSWORD_FILE='~/.dcxps_encryption_key'
    export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home'
    # export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home'
    # export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home'
    # export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home'
    export SHELL=/usr/local/bin/zsh
  ;;
  Linux)
    export SHELL=/usr/bin/zsh
  ;;
esac

# setting history
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PROJECT_DIR=$HOME/Projects

export AUTOHOST='/Users/greg/Projects/work'
export CLICOLOR=1
export DCX='/Users/greg/Projects/work'
export EDITOR='vim'
export FZF_DEFAULT_COMMAND='rg --files'
export GOPATH='/Users/greg/Projects/personal/go'
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/Bin
export TERM=xterm-256color
export VIMCONFIG=$HOME/.vim
export VIMDATA=$HOME/.vim

alias ascii='man ascii'
alias be='bundle exec'
alias delete_all_containers='docker ps -a -q | xargs --no-run-if-empty docker rm -f'
alias delete_all_exited_containers='docker ps -a -q --filter status=exited | xargs --no-run-if-empty docker rm -f'
alias docker_build='docker build -t $(basename $PWD) .'
alias established='lsof -P -i | grep -i established'
alias g='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gg='git grep'
alias gl='git log --pretty=oneline | head -n 25'
alias listening='sudo lsof -i -n -P | grep -i listen'
alias myip='curl -s https://icanhazip.com | tee /dev/tty | pbcopy'
alias prune_branches='git branch | grep -v "develop\|master" | xargs git branch -D'
alias run_brakeman='brakeman -A -z -f html -o $PWD/tmp/brakeman/brakeman.html'
alias start_mongo='./bin/mongod --bind_ip=127.0.0.1 --dbpath ../mongo_data'
alias utc='date -u'
alias v='vim'
alias vi='vim'
alias weather='curl wttr.in/sat'

source ~/.zshrc_private
setopt sharehistory

ulimit -n 2056

# functions
function h() {
  history | grep $*
}

function open_files_for_pid() {
  lsof -nPp $*
}

function strace_summary_for_pid() {
  strace -cp $*
}

function strace_ruby() {
  strace -f -e trace=execve $*
}

function test_ciphers() {
  nmap --script ssl-enum-ciphers -p 443 $*
}

function uninstall_gems() {
  for i in `gem list --no-versions`; do gem uninstall -aIx $i; done
}

# add identity to ssh-agent
ssh-add -A > /dev/null 2>&1

# include rvm
source ~/.rvm/scripts/rvm

# include zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^ ' autosuggest-accept

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[[ -s /usr/local/etc/grc.zsh ]] && source /usr/local/etc/grc.zsh

eval $(thefuck --alias)
