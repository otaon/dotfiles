"---------------------------------------------------------------------------
" カラー設定:
let g:molokai_original=1
colorscheme iceberg
set background=dark
"colorscheme jellybeans

" カーソル行をハイライト ---------------
set cursorline
" NOTE: この設定を有効にすると
" CUIだとカーソル移動が重くなる

" カーソル行のハイライトを消して、行番号だけハイライトする
hi clear CursorLine
" NOTE:
" 空白やタブ文字などの特殊文字をを表示するための設定のとき、
" カーソル行をハイライトすると、特殊文字が白くはっきりと見えてしまうため、
" 行番号だけのハイライトにする

"---------------------------------------------------------------------------
" フォント設定:
"
if has('win32')
  set guifont=Source_Code_Pro:h10:cANSI:qDRAFT
  set guifontwide=BIZ_UDゴシック:h10:cSHIFTJIS:qDRAFT
  "set guifontwide=UD_デジタル_教科書体_N-R:h10:cSHIFTJIS:qDRAFT
  "set guifontwide=MS_Gothic:h10:cANSI:qDRAFT
  "set guifont=Myrica_M:h12:cANSI:qDRAFT
  " カラー絵文字を表示したいのでDirectXでのレンダリングを有効化
  set rop=type:directx
  " 絵文字の曖昧幅はdoubleで固定させる
  set ambiwidth=double
  " 絵文字表示の弊害になるため下の設定は無効化
  "" 一部のUCS文字の幅を自動計測して決める
  "if has('kaoriya')
  "  set ambiwidth=auto
  "endif
  " 行間隔の設定
  "set linespace=4
elseif has('mac')
  set guifont=Andale\ Mono:h11
elseif has('xfontset')
  set guifontset=a14,r14,k14
else
  "lightlineに絵文字を使用したら表示が崩れたため、Sans Monoに変更
  "set guifont=Ubuntu\ Mono\ 14
  set guifont=DejaVu\ Sans\ Mono\ 12
endif

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" ウインドウの幅
set columns=140
" ウインドウの高さ
set lines=60
" コマンドラインの高さ(GUI使用時)
set cmdheight=2
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (GUI使用時)

"---------------------------------------------------------------------------

" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
set guioptions+=a

"入力モード時、ステータスラインのカラーを変更
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
"augroup END

"---------------------------------------------------
"ビープ音無し(フラッシュ使用は末尾の t_vb=削除)
set visualbell t_vb=

" --------------------------------------------------
" 入力時のカーソルの色を設定
if has('multi_byte_ime') || has('xim')
    " 日本語入力ON時のカーソルの色を設定
    highlight CursorIM guibg=Purple guifg=NONE
endif

