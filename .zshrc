# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:MaxPermSize=1024m"

#M2_HOME="/home/ubourdon/apps/apache-maven-3.0.4"
PLAY_HOME="/Users/ugobourdon/Dev/apps/play-2.2.1"
#MONGO_HOME="/home/ubourdon/apps/mongodb-linux-x86_64-2.0.1"
#GATLING_HOME="/home/ubourdon/apps/gatling-charts-highcharts-1.5.2"

#Alias maven
alias mci='mvn clean install -T8'
alias mcit='mvn clean install -T8 -Dmaven.test.skip'
alias mi='mvn install -T8'
alias mit='mvn install -T8 -Dmaven.test.skip'

# autojump z
. /Users/ugobourdon/z.sh

#Alias git
#alias glog='git log --color --oneline --decorate --graph'
#alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
#alias gst='git status -sb'
#alias gdiff='git diff --color'
#alias gco='git checkout'
#alias gshow='git show --name-only'
#alias gstandup='git log --since yesterday --oneline --author'

export PATH=$HOME/bin:/usr/local/bin:$PATH:$JAVA_HOME/bin:$PLAY_HOME
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

