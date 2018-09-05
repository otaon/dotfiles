
" --------------------------------------
" open-browser用設定
" --------------------------------------
" metrwのキーマップを無効化 ------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
" NOTE: vimのファイラのキーマップとの
" 競合を解消する

" カーソルのある文字列に対する操作 -----
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" openbrowserが提供する機能を以下に示す
" (openbrowser-smart-search)
"	URLなら開く。それ以外なら検索する
" (openbrowser-open)
"	全てのキーワードを開く
" (openbrowser-search)
"	全てのキーワードを検索する
"
