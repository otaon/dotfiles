if (!IsPluginInstalled('prabirshrestha/vim-lsp')) | finish | endif
" --------------------------------------
" Plugin vim-lsp (Vim Language Server Protocol)
" --------------------------------------

" Command                 | Description
" ------------------------+----------------------------------------------------------------------------------------------
" :LspCodeAction          | Gets a list of possible commands that can be applied to a file so it can be fixed (quick fix)
" :LspDeclaration         | Go to the declaration of the word under the cursor, and open in the current window
" :LspDefinition          | Go to the definition of the word under the cursor, and open in the current window
" :LspDocumentDiagnostics | Get current document diagnostics information
" :LspDocumentFormat      | Format entire document
" :LspDocumentRangeFormat | Format document selection
" :LspDocumentSymbol      | Show document symbols
" :LspHover               | Show hover information
" :LspImplementation      | Show implementation of interface in the current window
" :LspNextDiagnostic      | jump to next diagnostic (all of error, warning, information, hint)
" :LspNextError           | jump to next error
" :LspNextReference       | jump to next reference to the symbol under cursor
" :LspNextWarning         | jump to next warning
" :LspPeekDeclaration     | Go to the declaration of the word under the cursor, but open in preview window
" :LspPeekDefinition      | Go to the definition of the word under the cursor, but open in preview window
" :LspPeekImplementation  | Go to the implementation of an interface, but open in preview window
" :LspPeekTypeDefinition  | Go to the type definition of the word under the cursor, but open in preview window
" :LspPreviousDiagnostic  | jump to previous diagnostic (all of error, warning, information, hint)
" :LspPreviousError       | jump to previous error
" :LspPreviousReference   | jump to previous reference to the symbol under cursor
" :LspPreviousWarning     | jump to previous warning
" :LspReferences          | Find references
" :LspRename              | Rename symbol
" :LspStatus              | Show the status of the language server
" :LspTypeDefinition      | Go to the type definition of the word under the cursor, and open in the current window
" :LspTypeHierarchy       | View type hierarchy of the symbol under the cursor
" :LspWorkspaceSymbol     | Search/Show workspace symbol

" cf. https://qiita.com/kitagry/items/216c2cf0066ff046d200#lspworkspacesymbol


" --------------------------------------------------------------------------
" バッファを開いたとき、vim-lspが有効なら実行される設定
function! s:on_lsp_buffer_enabled() abort
    " オムニ補完(Ctrl-x,Ctrl-o)をlspのオムニ補完機能で上書き
    setlocal omnifunc=lsp#complete

    " 行番号の部分にアイコンを表示する列を追加する
    setlocal signcolumn=yes

    " tagジャンプをlspのtagジャンプ機能で上書き
    " とりあえず任意のファイルタイプに対してタグジャンプを上書き
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    " キーマップ(現在バッファ固有)
    " 現在ドキュメント内のジャンプ可能なシンボルを一覧表
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    " 現在ワークスペース内のジャンプ可能なシンボルを一覧表示
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    " カーソル下のリファレンスを検索する
    nmap <buffer> gr <plug>(lsp-references)
    " カーソル下の定義にジャンプ
    nmap <buffer> gd <plug>(lsp-definition)
    " カーソル下の実装先にジャンプ
    nmap <buffer> gi <plug>(lsp-implementation)
    " カーソル下の型定義にジャンプ
    nmap <buffer> gt <plug>(lsp-type-definition)
    " カーソル下のシンボルをリネーム
    "nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <F2> <plug>(lsp-rename)
    " 診断結果にジャンプ
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    " カーソル下のシンボルの情報をポップアップウィンドウに表示
    nmap <buffer> K <plug>(lsp-hover)
    " 画面のスクロールもlspのスクロールで上書きする
    " <expr>をつけることで、lsp#~~の実行結果が置換後の引数に指定される
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    " フォーマットのタイムアウトを1秒に設定
    let g:lsp_format_sync_timeout = 1000
    " RustとGo言語はファイル書き込み前にフォーマッタ実行を強制する
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " 折りたたみ制御をlspに任せる
    set foldmethod=expr
    set foldexpr=lsp#ui#vim#folding#foldexpr()
    set foldtext=lsp#ui#vim#folding#foldtext()

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" --------------------------------------------------------------------------
" vim-lspデバッグ用ログファイル出力設定
"let g:lsp_log_verbose = 1    " 1...詳細ログを出力
let g:lsp_log_file = expand('~/.vim/lsp/vim-lsp.log')

" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/.vim/lsp/vim-lsp-asyncomplete.log')

" --------------------------------------------------------------------------
" LspDocumentDiagnostics(エラー、警告の解析)を有効化するか
let g:lsp_diagnostics_enabled = 1

" --------------------------------------------------------------------------
"  カーソル下のシンボルへの参照
let g:lsp_document_highlight_enabled = 1 " カーソル下のシンボルへの参照をハイライトするか
let g:lsp_document_highlight_delay = 350 " ハイライトするまでの時間(msec.)

" シグネチャに関するヘルプを有効化するか
let g:lsp_signature_help_enabled = 1

" 現在行にあるエラーをステータス欄に表示するか
let g:lsp_diagnostics_echo_cursor = 1
" 現在行にあるエラーをステータス欄に表示するまでの時間(msec.)
let g:lsp_diagnostics_echo_delay = 500

" 現在行にあるエラーをポップアップウィンドウに表示するか
let g:lsp_diagnostics_float_cursor = 1
" 現在行にあるエラーをポップアップウィンドウに表示するまでの時間(msec.)
let g:lsp_diagnostics_float_delay = 500

" タイピング開始時に補完用ポップアップウィンドウを自動表示
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200

" テキスト編集時のサポート入力を有効化
let g:lsp_text_edit_enabled = 1

" --------------------------------------------------------------------------
" vim-lsp-settingの使い方
" cf. https://github.com/mattn/vim-lsp-settings
" How To: インストール
" インストール対応するファイルを開いた状態で
" :LspInstallServer
" How To: アンインストール
" :LspUninstallServer <server-name>
