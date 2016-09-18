# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# unlimited history
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
    screen-256color) color_prompt=yes;;
    rxvt-unicode-256color) color_prompt=yes;;
    st-256color) color_prompt=yes;;
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

# set host variable if the shell is controlled from ssh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	if [ "$color_prompt" = yes ]; then
		host="@\e[33;33m\]\h\[\033[00m\]"
	else
		host="@\h"
	fi
fi

if [ "$color_prompt" = yes ]; then
	# cyan
	# PS1="\[\e[00;36m\]${host} \[\e[0m\]\w \[\e[00;36m\]\\$\[\e[0m\] "
	# PS1="\[\e[01;36m\]${host} \[\e[0m\]\w \[\e[01;36m\]\\$\[\e[0m\] "
	PS1="\[\e[0m\]${host} \[\e[00;36m\]\w \[\e[0m\]\\$ "

	# blue
	# PS1="\[\e[00;34m\]${host} \[\e[0m\]\w \[\e[00;34m\]\\$\[\e[0m\] "
	# PS1="\[\e[01;34m\]${host} \[\e[0m\]\w \[\e[01;34m\]\\$\[\e[0m\] "
	# PS1="\[\e[0m\]${host} \[\e[00;34m\]\w \[\e[0m\]\\$ "

	# green
	# PS1="\[\e[00;32m\]${host} \[\e[0m\]\w \[\e[00;32m\]\\$\[\e[0m\] "
	# PS1="\[\e[01;32m\]${host} \[\e[0m\]\w \[\e[01;32m\]\\$\[\e[0m\] "
	# PS1="\[\e[0m\]${host} \[\e[00;32m\]\w \[\e[0m\]\\$ "

	# yellow
	# PS1="\[\e[00;33m\]${host} \[\e[0m\]\w \[\e[00;33m\]\\$\[\e[0m\] "
	# PS1="\[\e[01;33m\]${host} \[\e[0m\]\w \[\e[01;33m\]\\$\[\e[0m\] "
	# PS1="\[\e[0m\]${host} \[\e[00;33m\]\w \[\e[0m\]\\$ "
else
    PS1='${host} \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias vi='vim'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR=vi
export TORSOCKS_CONF_FILE=~/.torsocks.conf
export JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-x64
export ECLIPSE_HOME=/opt/eclipse
export GRADLE_HOME=/opt/gradle
export NNTPSERVER='news.gmane.org'

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

if [ "$COLORTERM" == "gnome-terminal" ] ; then
	TERM=xterm-256color
fi

# PATH
if [ -d /opt/gradle/bin ]; then
	export PATH=/opt/gradle/bin:$PATH
fi
if [ -d /opt/maven/bin ]; then
	export PATH=/opt/maven/bin:$PATH
fi
if [ -d $HOME/bin ]; then
	export PATH=$HOME/bin:$PATH
fi
if [ -d $HOME/.local/bin ]; then
	export PATH=$HOME/.local/bin:$PATH
fi

# useful functions
function certchain() {
	# Usage: certchain
    # Display PKI chain-of-trust for a given domain
    # GistID: https://gist.github.com/joshenders/cda916797665de69ebcd
    if [[ "$#" -ne 1 ]]; then
        echo "Usage: ${FUNCNAME} <ip|domain[:port]>"
        return 1
    fi

    local host_port="$1"

    if [[ "$1" != *:* ]]; then
        local host_port="${1}:443"
    fi

    openssl \
        s_client -connect "${host_port}" </dev/null 2>/dev/null \
        | grep -E '\ (s|i):'
}

function mux() {
	if [ -z "$1" ]; then
		tmux a || tmux
	else
		tmux a -t $1 || tmux new -s $1
	fi
}

fixssh() {
	for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
		if (tmux show-environment | grep "^${key}" > /dev/null); then
			value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
			export ${key}="${value}"
		fi
	done
}

export DARK=true

# extra information in git repositories
if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_FETCH_REMOTE_STATUS=0
  GIT_PROMPT_THEME=Solarized
  source ~/.bash-git-prompt/gitprompt.sh
fi

# fuzzy search for bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
