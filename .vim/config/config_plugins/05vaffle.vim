
" --------------------------------------
" vaffle用設定
" --------------------------------------
let g:vaffle_show_hidden_files = 1

" キーマップ設定 -----------------------
function! s:customize_vaffle_mappings() abort
	" Customize key mappings here
	nmap <Bslash> <Plug>(vaffle-toggle-current)
endfunction

augroup vimrc_vaffle
	autocmd!
	autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END

