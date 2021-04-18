if (!IsPluginInstalled('itchyny/lightline.vim')) | finish | endif
" --------------------------------------
" lightline用設定
" c.f. https://itchyny.hatenablog.com/entry/20130828/1377653592
" c.f. https://itchyny.hatenablog.com/entry/20130917/1379369171
" c.f. https://itchyny.hatenablog.com/entry/20130918/1379461406
" --------------------------------------
" ステータスライン設定 -----------------
let g:lightline = {
\   'colorscheme': 'powerline',
\   'mode_map': {'c': 'NORMAL'},
\   'active': {
\       'left':  [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
\       'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
\   },
\   'component_function': {
\       'modified':     'LightLineModified',
\       'readonly':     'LightLineReadonly',
\       'fugitive':     'LightLineFugitive',
\       'filename':     'LightLineFilename',
\       'fileformat':   'LightLineFileformat',
\       'filetype':     'LightLineFiletype',
\       'fileencoding': 'LightLineFileencoding',
\       'mode':         'LightLineMode'
\   }
\ }

let s:max_winwidth = 80

if has('unix') || has('mac') || has('win32')
  let s:pref_filename = '📝 '
  let s:pref_modified = '🔃 '
  let s:pref_not_modifiable = '🆖 '
  let s:pref_readonly = '⛔ '
  let s:pref_git_head = '🌵 '
  let s:pref_fileformat = '💻 '
  let s:pref_filetype = '📝 '
  let s:pref_fenc = '📄🔤 '
  let s:pref_enc = '🔤 '
"elseif has('win32')
"  let s:pref_filename = ''
"  let s:pref_modified = '+'
"  let s:pref_not_modifiable = '-'
"  let s:pref_readonly = 'x'
"  let s:pref_git_head = 'Git:'
"  let s:pref_fileformat = 'FF:'
"  let s:pref_filetype = 'FT:'
"  let s:pref_fenc = 'FENC:'
"  let s:pref_enc = 'ENC:'
endif

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? s:pref_modified : &modifiable ? '' : s:pref_not_modifiable
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? s:pref_readonly : ''
endfunction

function! LightLineFilename()
  let ro = LightLineReadonly()
  let fname = &ft == 'vimfiler'   ? vimfiler#get_status_string() :
            \ &ft == 'unite'      ? unite#get_status_string() :
            \ &ft == 'vimshell'   ? vimshell#get_status_string() :
            \ '' != expand('%:t') ? expand('%:t') :
            \ '[No Name]'
  let filename = s:pref_filename . fname
  let modified = LightLineModified()
  return join(filter([ ro, filename, modified ], "v:val != ''"))


"  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
"        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"        \  &ft == 'unite' ? unite#get_status_string() :
"        \  &ft == 'vimshell' ? vimshell#get_status_string() :
"        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction


function! LightLineFugitive()
  " Gitリポジトリ内のファイルなら"Git:ブランチ名"を表示
  if winwidth(0) < s:max_winwidth | return '' | endif
  try
    if &ft !~? 'vimfiler\|gundo' && IsPluginInstalled('tpope/vim-fugitive')
        let git_head = fugitive#head()
        return git_head != "" ? (s:pref_git_head . git_head) : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  if winwidth(0) < s:max_winwidth | return '' | endif
  return s:pref_fileformat . &fileformat
endfunction

function! LightLineFiletype()
  if winwidth(0) < s:max_winwidth | return '' | endif
  return s:pref_filetype . (strlen(&filetype) ? &filetype : '?')
endfunction

function! LightLineFileencoding()
  if winwidth(0) < s:max_winwidth | return '' | endif
    if strlen(&fenc)
      return s:pref_fenc . &fenc
    else
      return s:pref_enc . &enc
endfunction

function! LightLineMode()
  if winwidth(0) < s:max_winwidth - 20 | return '' | endif
  return lightline#mode()
endfunction
