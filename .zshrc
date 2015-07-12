# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="yc"

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
plugins=(git git-extras redis-cli z cp osx python common-aliases history brew\
    web-search git-flow-completion zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
alias mkp="grip | open -a /Applications/Google\ Chrome.app http://localhost:6419"

source ~/.env-dev
. `brew --prefix`/etc/profile.d/z.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Load all files from .shell/bashrc.d directory
if [ -d $HOME/.zsh.d ]; then
  for file in $HOME/.zsh.d/*.sh; do
    source $file
  done
fi
export PATH="/usr/local/sbin:$PATH"

alias gfw='proxychains4'

alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'
function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
    export PATH=$JAVA_HOME/bin:$PATH
    java -version
}
export PATH="/usr/local/sbin:$PATH"
export PATH=$(pyenv root)/shims:/usr/local/bin:/usr/bin:/bin:$PATH
export PATH="$HOME/anaconda3/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export SSLKEYLOGFILE=~/Desktop/wireshark/logfile/sslkeylog.log
eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/caiying/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/caiying/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/caiying/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/caiying/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

# added by travis gem
[ -f /Users/caiying/.travis/travis.sh ] && source /Users/caiying/.travis/travis.sh

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
