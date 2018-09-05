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
runtime! myconfig/init_common/*.vim
runtime! myconfig/init_plugins/*.vim
runtime! myconfig/config_common/*.vim
runtime! myconfig/config_plugins/*.vim
runtime! myconfig/config_color/*.vim

"--------------------------------------------------
"起動時のメッセージを消す
set shortmess+=I
