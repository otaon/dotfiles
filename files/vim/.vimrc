" vim:set foldlevel=100 foldmethod=marker ts=4 sts=2 sw=2 tw=0:
" ============================================================
" .vimrc
" 作成日時 不明
" 変更履歴
" 2015/07/04 記述を大幅に整理
" 2015/12/27 .vimrcを分割
" ============================================================

scriptencoding utf-8
" 内部のエンコーディングを設定したいなら、
" scriptencoding hoge よりも上の行に下記コマンドを記述すること
" set encoding=utf-8

" vimrc 分割
" windowsの場合でも.vimディレクトリをruntimepathに追加する
if has('win32')
	if &runtimepath !~# '\\.vim'
		let s:dotvim_dir = expand('~') . '\\.vim'
		execute 'set runtimepath^=' . s:dotvim_dir
	endif
endif

if has('win32')
	runtime! config\init_common\*.vim
	runtime! config\init_plugins\*.vim
	runtime! config\config_common\*.vim
	runtime! config\config_plugins\*.vim
	runtime! config\config_color\*.vim
else
	runtime! config/init_common/*.vim
	runtime! config/init_plugins/*.vim
	runtime! config/config_common/*.vim
	runtime! config/config_plugins/*.vim
	runtime! config/config_color/*.vim
endif

"--------------------------------------------------
"起動時のメッセージを消す
set shortmess+=I
