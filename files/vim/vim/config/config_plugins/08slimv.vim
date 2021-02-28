" 開き括弧を入力すると自動的に閉じ括弧を挿入する(デフォルト1)
let g:paredit_mode=1
" 括弧内で改行すると追加でもう一つ改行を挿入する。サブフォーム入力支援用。(デフォルト1)
let g:paredit_electric_return = 0

" REPLの表示位置
"   0: no split
"   1: horizontal split above (default)
"   2: horizontal split below
"   3: vertical split left
"   4: vertical split right
let g:slimv_repl_split=4
let g:slimv_repl_name='REPL'
" 評価する画面ではCtrl-Returnをすることで評価されるようにする
let g:slimv_repl_simple_eval=0

if has("win32")
	let g:slimv_lisp='ros run'
	let g:slimv_impl='sbcl'
elseif has("mac")
	let g:slimv_lisp='/usr/local/bin/ros run'
	let g:slimv_impl='sbcl'
elseif has("unix")
	let g:slimv_lisp='ros run'
	let g:slimv_impl='sbcl'
endif
"et g:slimv_preferred='clisp'

" ====================================================================
" swank起動コマンド設定

if has("unix")
	"" roswell ver.
	"let g:slimv_swank_cmd = '! xterm -e ros --load ~/.roswell/lisp/slime/$DATE/start-swank.lisp &'

	"" roswell ver. (swankを直接起動)
	"let g:slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server :port 4005 :dont-close t)' wait &"
	let g:slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server)' wait &"

elseif has("win32")
	" roswell ver.
	"let g:slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server :port 4005 :dont-close t)' wait &"
	let g:slimv_swank_cmd='!start-process powershell.exe '.$HOME.'\\vimfiles\\myconfig\config_plugins\\run-swank.ps1'

elseif has("mac")
	" roswell ver. (同じターミナルの新規タブでslimvが用意したswank起動)
	let g:slimv_swank_cmd = '!osascript $HOME/.vim/myconfig/config_plugins/08slimv-roswell.scpt'

	" roswell ver.
	"let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \
	"\"ros run --load $HOME/.roswell/lisp/slime/2018.03.28/start-swank.lisp\""'

	" roswell ver. (swankはslimvが用意したもの)
	"let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \
	"\"ros run --load '.$HOME.'/.vim/bundle/slimv/slime/start-swank.lisp\""'

	" clisp ver. (frame-call関数がインプリメントされないのでslime debuggerがまともに動かない)
	"let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \
	"\"clisp --load '.$HOME.'/.vim/bundle/slimv/slime/start-swank.lisp\""'
endif

" ====================================================================

" swankサーバのポート設定
let g:swank_port = 4005

" 括弧をカラフルに表示する
let g:lisp_rainbow=1

" asdf用のファイルタイプをlispに設定する
autocmd BufNewFile,BufRead *.asd set filetype=lisp

" 現在のファイルだけを対象としてタグファイルを作成
function! s:generate_lisp_tags()
  let g:slimv_ctags='ctags -a -f '.$HOME.'/.tags/lisp.tags '.expand('%:p').' --language-force=Lisp'
  call SlimvGenerateTags()
endfunction
command! -nargs=0 GenerateLispTags call <SID>generate_lisp_tags()

" 再帰的にタグファイルを作成
function! s:generate_lisp_tags_recursive()
  let g:slimv_ctags='ctags -a -f '.$HOME.'/.tags/lisp.tags -R '.expand('%:p:h').' --language-force=Lisp'
  call SlimvGenerateTags()
endfunction
command! -nargs=0 GenerateLispTagsRecursive call <SID>generate_lisp_tags_recursive()

