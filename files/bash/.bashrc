alias ls='ls -G'
alias la='ls -a'
alias ll='ls -l'
alias l='ls -F'
alias mv='mv -i'
alias rm='rm -i'
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias prev="open -a Preview"
alias gvim="open -a MacVim"

if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

# first PS1 setting
# export PS1="\h:\W \u\$"
export PS1="\[\033[032m\]\u@\h\[\033[0m\]:\[\033[034m\]\w\[\033[0m\]$ "

# auto start tmux
if [ -z "$TMUX" -a -z "$STY" ]; then
	if type tmuxx >/dev/null 2>&1; then
		~/myscripts/tmuxx
	elif type tmux >/dev/null 2>&1; then
		if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
			tmux attach && echo "tmux attached session "
		else
			tmux new-session && echo "tmux created new session"
		fi
	#elif type screen >/dev/null 2>&1; then
		#screen -rx || screen -D -RR
	fi
fi

export PATH="$PATH:/Applications/microchip/xc8/v1.44/bin"
