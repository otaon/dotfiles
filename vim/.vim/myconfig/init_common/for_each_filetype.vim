"" ファイル個別の設定 ------------------------------------ {{{
" テキストファイル用設定 ---------------
autocmd FileType text setlocal textwidth=0

" arduinoファイル用設定 ----------------
autocmd BufNewFile,BufRead *.pde setf arduino

" rubyファイル用設定 -------------------
"%での括弧等の対応付けの拡張
source $VIMRUNTIME/macros/matchit.vim
autocmd BufNewFile,BufRead *.rb let b:match_words='\<do\>:\<end\>'
autocmd BufNewFile,BufRead *.rb set autoindent

" cファイル用設定 ----------------------
autocmd BufNewFile,BufRead *.c set cindent

" markdownファイル用設定 ---------------
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"" ------------------------------------------------------- }}}

