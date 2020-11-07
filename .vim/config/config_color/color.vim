" --------------------------------------
" ハイライト設定関連
" --------------------------------------

" 構文ハイライトをONにする -------------
syntax on

" カラースキーム設定 -------------------
"set background=light
"let g:solarized_italic=0
"let g:solarized_contrast="high"
"colorscheme solarized
"" NOTE: solarizedに設定する

"colorscheme molokai
"" NOTE: molokaiに設定する

"colorscheme jellybeans
"" NOTE: jellybeansに設定する

colorscheme iceberg
" NOTE: icebergに設定する

" カーソル行をハイライト ---------------
"set cursorline
" NOTE: この設定を有効にすると
" CUIだとカーソル移動が重くなる

" 検索結果をハイライト -----------------
set hlsearch

" 全角文字の表示用設定 -----------------
if exists('&ambiwidth')
	set ambiwidth=double
endif
" NOTE:	四角や丸等の文字があっても、
" カーソルの位置が乱れないようにする

" 行末のスペースの連続をハイライト -----
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces ctermfg=darkred ctermbg=black guifg=darkred guibg=black
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" 全角スペースをハイライト -------------
function! JISX0208SpaceHilight()
	syntax match JISX0208Space "　" display containedin=ALL
	"highlight JISX0208Space term=NONE ctermbg=lightblue gui=NONE guifg=#004B4B guibg=#202020
	highlight JISX0208Space term=underline ctermfg=darkcyan ctermbg=black gui=underline guifg=darkcyan guibg=black
endf
" syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる 
if has("syntax")
	syntax on
	augroup invisible
		autocmd! invisible
		autocmd BufNew,BufRead * call JISX0208SpaceHilight()
	augroup END
endif
" NOTE:	Tab文字も区別されずにハイライトされるので、
" 区別したいときはTab文字の表示を別に設定する
