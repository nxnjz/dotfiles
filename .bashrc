# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

color_prompt=yes;

function nonzero_return() {
  RETVAL=$?
  [ $RETVAL -ne 0 ] && echo "$RETVAL"
}

reset=`tput sgr0`
bold=`tput bold`
green=`tput setaf 2`
blue=`tput setaf 4`

PS1="\[$bold\]\[$green\]\u@\h\[$reset\]:\[$blue\]\w\[$reset\]\\$\`nonzero_return\` "

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#;;
#*)
  #;;
  #esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -la'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export LC_ALL=en_US.UTF-8

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  source ~/.config/exercism/exercism_completion.bash
fi

alias andstudio='/home/karl/software/android-studio/bin/studio.sh'
source /home/karl/.cargo/env
export PATH=/home/karl/.cargo/bin:/home/karl/.local/bin:/home/karl/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/karl/.gem/ruby/2.6.0/bin
export VULTR_API_KEY=`cat ~/.keys/vultr`
#alias ls='exa'
shopt -s dirspell direxpand autocd cdspell cdable_vars

vultradm=~/Documents/rust/vultradm/

cd() {
  if [ $# -eq 0 ]
  then
    builtin cd $HOME && pushd -n $OLDPWD 1>/dev/null
  else
    builtin cd "$*" && pushd -n $OLDPWD 1>/dev/null
  fi
}


export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/home/karl/go/bin
export GOPATH=/home/karl/go
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin
export BB=~/Document/bugbounty
export BB2=~/Documents/bugbountyhdd
export GITROB_ACCESS_TOKEN=`cat ~/.keys/gitrob`



#############
#lazy aliases
alias thewp="wpscan --rua -t 20 -e vp,vt,cb,dbe,u1-100 --plugins-detection mixed --api-token `cat ~/.keys/wpscan` --url"
alias theaquatone="aquatone -ports xlarge -http-timeout 30000 -scan-timeout 1000 -screenshot-timeout 60000 -out aquatone"
alias t=task
alias "tl"="task list"
alias ti=timew
alias sshh="ssh -o 'UserKnownHostsFile /dev/null'"
alias ovh="mosh root@ovh.ovh"
alias contabo="mosh root@0.contabo"
alias bd=". bd -si"
alias rg="rg -i"
alias toclipb="xclip -selection clipboard"
alias nmap="sudo nmap"
alias thenmap="nmap -sV -sC -vvv -T4"
alias netctl="sudo netctl"
alias s="sudo"
alias profilefox="firefox --new-instance --ProfileManager"

toburp() {
  for url in `cat $1 | cut -d ' ' -f1`
  do 
    curl --proxy http://127.0.0.1:8080 -k $url
  done
}

cdb() {
  rg -i "(lof|tit|tag|eg).*$1"
}



############
#some stuff for pyenv to work

export PATH="/home/karl/.pyenv/shims:${PATH}"
export PYENV_SHELL=bash
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
    rehash|shell)
      eval "$(pyenv "sh-$command" "$@")";;
    *)
      command pyenv "$command" "$@";;
  esac
}

