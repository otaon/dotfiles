###################
# zsh固有の設定
###################
# 色の使用
autoload -Uz colors; colors

# ビープを鳴らさない
setopt nobeep

# Color
export TERM=xterm-256color
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gの代わり)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 左プロンプト設定
PROMPT='%(!.%{${fg_no_bold[red]}%}.%{${fg_no_bold[green]}%})%n%{${fg_no_bold[yellow]}%}@%{${fg_no_bold[cyan]}%}%m%{${reset_color}%}:%{${fg[yellow]}%}%~%{${reset_color}%}
%{${fg_no_bold[yellow]}%}%(!.#.$)%{${reset_color}%} '

# 右プロンプト設定
# NOTE: vcs管理下のディレクトリの場合にステータスを表示
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# プロンプト設定に含まれるスクリプトを展開する
setopt prompt_subst
# 最新以外の右プロンプト表示を消す
setopt transient_rprompt

# 環境変数
export LANG=ja_JP.UTF-8

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g GI='| grep -i'

# ヒストリの設定
HISTFILE=~/.zsh_history		# ヒストリを保存するファイル
HISTSIZE=10000				# メモリに保存されるヒストリの件数
SAVEHIST=10000				# 保存されるヒストリの件数
setopt bang_hist			# !を使ったヒストリ展開を行う(d)
setopt extended_history		# ヒストリに実行時間も保存する
setopt hist_ignore_dups		# 直前と同じコマンドはヒストリに追加しない
setopt share_history		# 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks	# 余分なスペースを削除してヒストリに保存する
setopt extended_history		# zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt magic_equal_subst	# --prefix=/usr などの = 以降も補完
setopt numeric_glob_sort	# ファイル名の展開で辞書順ではなく数値的にソート


# zsh-completion(zshの補完拡張)
## autoload -U compinit; compinit
fpath=(~/.zsh/zsh-completions/src $fpath)

# 補完関係
setopt correct					# 入力しているコマンド名が間違っている場合にもしかして：を出す
autoload -U compinit; compinit	# 補完機能を有効にする
setopt auto_list				# 補完候補を一覧で表示する(d)
setopt auto_menu				# 補完キー連打で補完候補を順に表示する(d)
setopt list_packed				# 補完候補をできるだけ詰めて表示する
setopt list_types				# 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete	# Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'	# 補完時に大文字小文字を区別しない

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

###################
# zshとbash共有
###################

# エイリアス
#alias ls='ls -G'
alias la='ls -a'
alias ll='ls -l'
alias l='ls -F'
alias mv='mv -i'
alias rm='rm -i'
alias grep='grep --color'
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias prev="open -a Preview"
alias gvim="open -a MacVim"

#下のはHomebrewに移行した後でも使うかもしれないので消さずにとっておく
## MacPorts関連
#if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
#  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#fi

# XQuartz(X11)で日本語入力する設定(MacUIM)
export XMODIFIERS="@im=uim"
export GTK_IM_MODULE="uim"

## auto start tmux
#if [ -z "$TMUX" -a -z "$STY" ]; then
#	if type tmuxx >/dev/null 2>&1; then
#		~/myscripts/tmuxx
#	elif type tmux >/dev/null 2>&1; then
#		if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
#			tmux attach && echo "tmux attached session "
#		else
#			tmux new-session && echo "tmux created new session"
#		fi
#	#elif type screen >/dev/null 2>&1; then
#		#screen -rx || screen -D -RR
#	fi
#fi
#

########################
# tree の文字化け対策
########################
if type tree >/dev/null 2>&1; then 
	if [ "$(uname)" = 'Darwin' ]; then
		alias tree='tree -N'
	fi
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## vim:set ft=zsh :

