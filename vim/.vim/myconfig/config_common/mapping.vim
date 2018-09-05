"" 操作系の設定 ------------------------------------------ {{{
" --------------------------------------
" キーボード用基本設定
" --------------------------------------
" キーマップ設定 -----------------------
noremap ; :
noremap : ;
" NOTE: US配列キーボードで;と:を入れ替えるキーマッピング
nmap bb :ls<CR>:buf 
" ZZ(保存して閉じる)とZQ(保存せずに閉じる)を無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
" NOTE: 誤操作防止

" xとsで自動的にヤンクされる先を削除用レジスタに変更
nnoremap x "_x
nnoremap s "_s

" 標準の<C-d>のマッピング(インデントを減らす)を潰して、Deleteに変更
inoremap <C-d> <Del>
" 標準の<C-h>のマッピング(カーソルを行頭に移動)を潰して、Backspaceに変更
imap <C-h> <BS>



" --------------------------------------
" Prefix用設定
" --------------------------------------
" 使用済みキー一覧{{{
" A
" B
" C
" D
" E
" F
" G
" H
" I
" J
" K
" L
" M Minimap
" N
" O
" P Previm
" Q
" R
" S
" T Tagbar
" U
" V
" W
" X
" Y
" Z
" a
" b buffer
" c
" d
" e
" f
" g
" h
" i
" j
" k
" l
" m
" n buffer
" o
" p buffer
" q
" r
" s
" t
" u
" v
" w
" x openbrowser
" y
" z
"}}}

noremap [prefix] <Nop>
nmap <Space> [prefix]
" NOTE: Spaceキーを自分のプレフィックスキーとする

" バッファ操作用マッピング
nnoremap <silent> [prefix]n :bn<cr>
nnoremap <silent> [prefix]p :bp<cr>
nnoremap <silent> [prefix]b :ls<CR>:buf 

" カーソル下の単語をハイライトするマッピング
" "z   ｚレジスタ使用(直接/レジスタにヤンクしても動作しない)
" yiw  カーソル下の単語をヤンク
" :let @/ = '\<' . @z . '\>'<CR> zレジスタの内容を/レジスタに代入
" :set hlsearch<CR> ・・・ hlsearch（ハイライト検索）ON
nnoremap <silent> [prefix]<Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" 検索ハイライトをOFFにする
nnoremap [prefix]/ :nohlsearch<Return>

" Tagbarの表示をトグルさせる
nnoremap <silent> [prefix]T :<C-u>TagbarToggle<CR>

" Minimapの表示をトグルさせる
nnoremap <silent> [prefix]M :<C-u>MinimapToggle<CR>

" --------------------------------------
" Unite用設定
" --------------------------------------
" プレフィックスキーの設定 -------------
nnoremap [unite] <Nop>
"nmap    <Leader>u [unite]
"" NOTE: <Leader>はデフォルトだと\のこと
nmap [prefix]u [unite]

" キーマップ設定 -----------------------
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
" ブックマーク一覧
nnoremap <silent> [unite]B :<C-u>Unite<Space>bookmark<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]vr :UniteResume<CR>
" NOTE: 参考URL
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc

" --------------------------------------
" unite-build用設定
" --------------------------------------
nnoremap <silent> [unite]vb :Unite build<CR>
nnoremap <silent> [unite]vcb :Unite build:!<CR>
nnoremap <silent> [unite]vch :UniteBuildClearHighlight<CR>

" --------------------------------------
" previm用設定
" --------------------------------------
nnoremap [previm] <Nop>
nmap [prefix]P [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

" --------------------------------------
" open-browser用設定
" --------------------------------------
" カーソルのある文字列に対する操作 -----
nmap [prefix]x <Plug>(openbrowser-smart-search)
vmap [prefix]x <Plug>(openbrowser-smart-search)
" openbrowserが提供する機能を以下に示す
" (openbrowser-smart-search)
"	URLなら開く。それ以外なら検索する
" (openbrowser-open)
"	全てのキーワードを開く
" (openbrowser-search)
"	全てのキーワードを検索する

"" ------------------------------------------------------- }}}
