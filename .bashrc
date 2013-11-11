# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#colorized my bashrc prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function proml {
  PS1='\[\e]0;\w\a\]\n\[\e[1;32m\]\u@\h \[\e[1;33m\]\w (\[\e[1;31m\]$(parse_git_branch)\[\e[1;33m\]) \[\e[0m\]\n\$ '
  PS2='> '
  PS4='+ '
}
proml


JAVA_HOME_7_ORACLE="/usr/lib/jvm/jdk1.7.0_13"
JAVA_HOME_7="/usr/lib/jvm/java-7-openjdk-amd64"
JAVA_HOME_6="/usr/lib/jvm/jdk1.6.0_35"


#export JAVA_HOME=$JAVA_HOME_6

switchJHome() {
    if [ $1 = "7" ]
    then echo "switch to jdk 7"; export JAVA_HOME=$JAVA_HOME_7  #$(cat ~/.bashrc | sed 's/$JAVA_HOME_7/$JAVA_HOME_7/' > ~/.toto.jdk); cp ~/.toto.jdk ~/.bashrc; rm ~/.toto.jdk;

    elif [ $1 = "6" ]
    then echo "switch to jdk 6"; export JAVA_HOME=$JAVA_HOME_6  #$(cat ~/.bashrc | sed 's/$JAVA_HOME_7/$JAVA_HOME_7/' > ~/.toto.jdk); cp ~/.toto.jdk ~/.bashrc; rm ~/.toto.jdk;

    elif [ $1 = "7O" ]
    then echo "switch to jdk 7 oracle"; export JAVA_HOME=$JAVA_HOME_7_ORACLE

    else echo "switch only java 6 or 7"; echo "use 6(jdk 6), 7(open jdk 7) or 7O (Oracle)"; export JAVA_HOME=$JAVA_HOME_6
    fi

    source ~/.bashrc
}


# autorun autojump
. /usr/share/autojump/autojump.sh

#scriptBranchVIDAL
export createMonthly_home="/home/VALTECH/VIDAL"

export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:MaxPermSize=1024m"

M2_HOME="/home/ubourdon/apps/apache-maven-3.0.4"
PLAY_HOME="/home/ubourdon/apps/play-2.2.0"
MONGO_HOME="/home/ubourdon/apps/mongodb-linux-x86_64-2.0.1"
SBT_HOME="/home/ubourdon/apps/sbt"
GATLING_HOME="/home/ubourdon/apps/gatling-charts-highcharts-1.5.2"

export INSTALL4J_HOME=/home/ubourdon/apps/install4j5
export INSTALL4J_HOME_5_1_5=/home/ubourdon/apps/install4j5_iha
export PATH=$PATH:~/bin:$JAVA_HOME/bin:$M2_HOME/bin:$PLAY_HOME:$MONGO_HOME/bin:$SBT_HOME/bin:$INSTALL4J_HOME/bin:$INSTALL4J_HOME_5_1_5/bin:$GATLING_HOME/bin

alias idea='/home/ubourdon/apps/idea-IU-129.713/bin/idea.sh'
#'/home/ubourdon/apps/idea-IU-123.169/bin/idea.sh'

alias coffee='/home/ubourdon/apps/node_modules/.bin/coffee'

#Alias maven
alias mci='mvn clean install -T8'
alias mcit='mvn clean install -T8 -Dmaven.test.skip'
alias mi='mvn install -T8'
alias mit='mvn install -T8 -Dmaven.test.skip'


#Alias git
#alias glog='git log --color --oneline --decorate --graph'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gst='git status -sb'
alias gdiff='git diff --color'
alias gco='git checkout'
alias gshow='git show --name-only'
alias gstandup='git log --since yesterday --oneline --author'
