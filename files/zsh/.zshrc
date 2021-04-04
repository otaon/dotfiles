# ******************************************************************************************************
# zsh固有の設定
# ******************************************************************************************************

# 一般設定

autoload -Uz colors; colors		# 色の使用
setopt nobeep					# ビープを鳴らさない

# -----------------------------------------------------------------------------------------------------
# 環境変数
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
# 言語設定
export LANG=ja_JP.UTF-8

## MacUIM
## XQuartz(X11)で日本語入力する設定
#export XMODIFIERS="@im=uim"
#export GTK_IM_MODULE="uim"


# -----------------------------------------------------------------------------------------------------
# プロンプト

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

setopt transient_rprompt	# 最新以外の右プロンプト表示を消す

setopt auto_pushd			# cd したら自動的にpushdする
setopt pushd_ignore_dups	# 重複したディレクトリを追加しない

setopt prompt_subst			# プロンプト設定に含まれるスクリプトを展開する

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g GI='| grep -i'


# -----------------------------------------------------------------------------------------------------
# ウィンドウ名

# ウィンドウタイトルを設定
function set_titles() {
  # カレントディレクトリパスを $HOME を ~ として表示
  local wname=`pwd | sed -e "s|$HOME|~|"`
  echo -ne "\033]2;$wname\007"
}


# -----------------------------------------------------------------------------------------------------
# プロンプト表示直前hook関数に登録
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_titles


# -----------------------------------------------------------------------------------------------------
# 補完
fpath=(~/.zsh/zsh-completions/src $fpath)
autoload -U compinit; compinit	# 補完機能を有効にする
setopt always_last_prompt		# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt auto_list				# 補完候補を一覧で表示する(d)
setopt auto_menu				# 補完キー連打で補完候補を順に表示する(d)
setopt auto_param_keys			# カッコの対応などを自動的に補完
setopt auto_param_slash			# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt brace_ccl				# 範囲指定できるようにする 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
setopt complete_in_word			# 語の途中でもカーソル位置で補完
setopt correct					# 入力しているコマンド名が間違っている場合にもしかして：を出す
setopt extended_glob			# 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt interactive_comments		# コマンドラインでも'#' 以降をコメントとして扱う
setopt list_packed				# 補完候補をできるだけ詰めて表示する
setopt list_types				# 補完候補にファイルの種類も表示する
setopt magic_equal_subst		# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt mark_dirs				# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt no_flow_control			# フローコントロールを無効にする
setopt print_eight_bit			# 日本語ファイル名を表示可能にする

# 補完関数の表示を強化する
cdpath=(~ ~/git)	#あらかじめcdpathを設定しておく
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' group-name ''				# マッチ種別を別々に表示
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'	# 補完時に大文字小文字を区別しない
zstyle ':completion:*' use-cache true	# apt-getとかdpkgコマンドをキャッシュを使って速くする
zstyle ':completion:*' verbose yes
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters	# 変数の添字を補完する
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'	# オブジェクトファイル等はfileとして補完させない
zstyle ':completion:*:cd:*' tag-order local-directories path-directories	# カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補に出す
zstyle ':completion:*:cd:*' ignore-parents parent pwd	#cd は親ディレクトリからカレントディレクトリを選択しないので表示させないようにする (例: cd ../<TAB>):
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:manuals' separate-sections true	# manの補完をセクション番号別に表示させる
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# 補完用のキーバインド
bindkey "^[[Z" reverse-menu-complete	# Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)

# -----------------------------------------------------------------------------------------------------
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


# ******************************************************************************************************
# zshとbash共有
# ******************************************************************************************************

# エイリアス
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias l='ls -F'
alias mv='mv -i'
alias rm='rm -i'
alias grep='grep --color'
#alias firefox="open -a Firefox"
#alias safari="open -a Safari"
#alias prev="open -a Preview"
#alias gvim="open -a MacVim"


# ******************************************************************************************************
# ソフトウェア独自設定
# ******************************************************************************************************

# tree
# tree の文字化け対策
if type tree >/dev/null 2>&1; then 
	if [ "$(uname)" = 'Darwin' ]; then
		alias tree='tree -N'
	fi
fi


# -----------------------------------------------------------------------------------------------------
## pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"


# -----------------------------------------------------------------------------------------------------
# tmux
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

# -----------------------------------------------------------------------------------------------------
# macport
#下のはHomebrewに移行した後でも使うかもしれないので消さずにとっておく
## MacPorts関連
#if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
#  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#fi


# vim:set ft=zsh :

