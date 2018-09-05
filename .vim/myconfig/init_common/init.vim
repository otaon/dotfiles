"" Vim用設定にする(バイバイ、VI)-------------------------- {{{
if &compatible
  set nocompatible
endif
" NOTE: nocompatibleが設定されている状態で更に設定すると、
" 特定のオプション(historyなど)が初期化される副作用がある。
" これを上記のようにif-thenルールによって回避する。
"" ------------------------------------------------------- }}}

" 開いたファイルのエンコードを照会する順番 --------------- {{{
set fileencodings=guess,utf-8,iso-2022-jp,sjis,euc-jp,ucs-bom,default,latin1,ucs-2le,ucs-2,iso-2022-jp-3,euc-jisx0213
" NOTE: 忌まわしきlatin1の優先度を下げる
"" ------------------------------------------------------- }}}

"" バックアップファイル・スワップファイル設定 ------------ {{{
" バックアップファイルの保存先設定 -----
set backupdir=$HOME/.backup

" バックアップファイルの拡張子を設定----
set backupext=.vimback

" アンドゥファイルの保存先設定 ---------
set undodir=$HOME/.undo

" スワップファイルの保存先設定 ---------
let &directory = &backupdir
" NOTE: バックアップファイルと同じ場所に作成する
"" ------------------------------------------------------- }}}

"" 各種ディレクトリの設定 -------------------------------- {{{
" カレントディレクトリの場所 -----------
set autochdir
"autocmd BufEnter * execute ":lcd " . expand("%:p:h")
" NOTE: 操作中のファイルが有る場所を、
" そのウィンドウのカレントディレクトリにする

" 辞書ファイルの場所 -------------------
autocmd FileType *  execute printf("setlocal dict+=$HOME/.vim/vimdictionary/%s.dict", &filetype)
"" ------------------------------------------------------- }}}
