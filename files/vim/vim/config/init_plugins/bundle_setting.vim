" ==============================================================================
" Vundleの設定・プラグインのインストール
" ==============================================================================
" NOTE: Vundle is used to manage plugins
" How To Install Plugins:
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall

"" プラグインのリポジトリ管理 ---------------------------------------------- {{{
" Vundle用設定 -----------------------------------------------------------------
" Vundle実行のための設定
" 1. compatibleを無効化する
if &compatible
	set nocompatible
endif

" 2. filetype設定を一時無効化する
filetype off

" 3. ランタイムパス設定(デリミタ非依存になるように実装した)
let s:Vundle_dir = fnamemodify(expand('~/.vim/bundle/Vundle.vim'), 'p:')
if &runtimepath !~# 'Vundle.vim'
	" Vundleが存在していない場合はgithubからcloneする
	if !isdirectory(s:Vundle_dir)
		execute '!git clone https://github.com/VundleVim/Vundle.vim.git' s:Vundle_dir
	endif
	" ランタイムパスにVundleのディレクトリを追加する
	execute 'set runtimepath^=' . s:Vundle_dir
endif

" プラグインのインストール設定" ------------------------------------------------
let s:bundle_path = expand('~/.vim/bundle')
call vundle#begin(s:bundle_path)

" NOTE: 上記のメソッドコールとcall vundle#end()で
" プラグイン一覧を挟む必要がある

" Vundle自体(必須)--------------------------------------------------------------
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 非同期処理を行うため
Plugin 'Shougo/vimproc.vim'

" Vimで使えるShell
Plugin 'Shougo/vimshell'

"" ファイルやバッファをリスト表示する
"Plugin 'Shougo/unite.vim'

" uniteから分離したmruファイル用設定
Plugin 'Shougo/neomru.vim'

" 非同期でmakeし、結果をuniteに出力
Plugin 'Shougo/unite-build'

" 入力補完を行うため
Plugin 'Shougo/neocomplcache'

" スニペット補完を行うため
Plugin 'Shougo/neosnippet'

" スニペット集
Plugin 'Shougo/neosnippet-snippets'

" バイナリファイルエディタ
Plugin 'Shougo/vinarise.vim'

" アウトライン表示
Plugin 'Shougo/unite-outline'

"markdown記法を使うため
Plugin 'previm/previm'

"vimからブラウザを開くため
Plugin 'tyru/open-browser.vim'

" スニペット集
Plugin 'honza/vim-snippets'
Plugin 'rcmdnk/vim-octopress-snippets'

"記述したコードの構文チェック
Plugin 'scrooloose/syntastic'

"Ruby向けにendを自動挿入する
Plugin 'tpope/vim-endwise'

"ログファイルを色付けする
Plugin 'vim-scripts/AnsiEsc.vim'

"vimでSublimeのminimapライクな表示
Plugin 'severin-lemaignan/vim-minimap'

"ステータスラインを簡単に設定する
Plugin 'itchyny/lightline.vim'

"ディレクトリをTree表示する
Plugin 'majutsushi/tagbar'

" pythonで入力補完する
"Plugin 'davidhalter/jedi-vim'

"ファイラ
Plugin 'cocopon/vaffle.vim'

" スニペットプラグイン
Plugin 'SirVer/ultisnips'

"w3mをvimに使う
"Plugin 'yuratomo/w3m.vim'

" LispやClojure(Lisp方言の方)の開発環境
Plugin 'kovisoft/slimv'
" NOTE:	VimClojureと競合するので、
" 使うときはどちらかを無効にする

" Clojure(Lisp方言の方)の開発環境
"NeoBundle 'VimClojure'
" NOTE:	slimvと競合するので、
" 使うときはどちらかを無効にする。
" 使用可能にするには以下の設定が必須
"	syntax on(他所で設定済み)
"	filetype plugin indent on(他所で設定済み)

"カラースキーム
Plugin 'altercation/vim-colors-solarized'
Plugin 'w0ng/vim-hybrid'
Plugin 'sjl/badwolf'
Plugin 'nanotech/jellybeans.vim'
Plugin 'AlessandroYorba/Alduin'
Plugin 'chriskempson/tomorrow-theme', {'rtp' : 'vim'}
Plugin 'freeo/vim-kalisi', {'rtp' : 'vim'}
Plugin 'reedes/vim-colors-pencil'
Plugin 'jacoborus/tender.vim'
Plugin 'romainl/Apprentice'
Plugin 'cocopon/iceberg.vim'
Plugin 'tomasr/molokai'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'morhetz/gruvbox'
Plugin 'arcticicestudio/nord-vim'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'whatyouhide/vim-gotham'
Plugin 'vim-scripts/twilight'

" リポジトリ管理終了
call vundle#end()
"" ------------------------------------------------------------------------- }}}

""" ファイルの関連付けON---------------------------------------------------- {{{
filetype plugin indent on
"" NOTE: 上記で一時無効化していたので、有効化
"" filetype plugin on と filetype indent on を行った状態になる。
"" 設定の意味はfiletypeおよびfiletype-overview参照。
"" compatibleを解除しないとonに出来ない。
""" ------------------------------------------------------------------------ }}}

"" シンタックスの有効化----------------------------------------------------- {{{
syntax enable
"" ------------------------------------------------------------------------- }}}

