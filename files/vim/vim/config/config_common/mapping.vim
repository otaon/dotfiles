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
noremap [prefix] <Nop>
nmap <Space> [prefix]
" NOTE: Spaceキーを自分のプレフィックスキーとする

" バッファ操作用マッピング
nnoremap <silent> [prefix]n :bn<CR>
nnoremap <silent> [prefix]p :bp<CR>
nnoremap <silent> [prefix]b :ls<CR>:buf<Space>

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

" プレフィックスキーの設定 -------------
"nmap    <Leader> \
"" NOTE: <Leader>はデフォルトだと\

" --------------------------------------
" previm用設定
" --------------------------------------
nnoremap [previm] <Nop>
nmap [prefix]P [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

"" ------------------------------------------------------- }}}
