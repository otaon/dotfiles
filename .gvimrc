"---------------------------------------------------------------------------
" �J���[�ݒ�:
let g:molokai_original=1
colorscheme iceberg
"set background=dark
"colorscheme jellybeans

" �J�[�\���s���n�C���C�g ---------------
set cursorline
" NOTE: ���̐ݒ��L���ɂ����
" CUI���ƃJ�[�\���ړ����d���Ȃ�

"---------------------------------------------------------------------------
" �t�H���g�ݒ�:
"
if has('win32')
  " Windows�p
  set guifont=M+1VM+IPAG_circle:h11:cSHIFTJIS
  "set guifont=MS_Gothic:h11:cSHIFTJIS
  "set guifont=MS_Mincho:h11:cSHIFTJIS
  " �s�Ԋu�̐ݒ�
  set linespace=0
  " �ꕔ��UCS�����̕��������v�����Č��߂�
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Andale\ Mono:h11
elseif has('xfontset')
  " UNIX�p (xfontset���g�p)
  set guifontset=a14,r14,k14
else
  set guifont=Ubuntu\ Mono\ 11
endif

"---------------------------------------------------------------------------
" �E�C���h�E�Ɋւ���ݒ�:
"
" �E�C���h�E�̕�
set columns=140
" �E�C���h�E�̍���
set lines=60
" �R�}���h���C���̍���(GUI�g�p��)
set cmdheight=2
" ��ʂ����n�ɔ��ɂ��� (���s�̐擪�� " ���폜����ΗL���ɂȂ�)
"colorscheme evening " (GUI�g�p��)
" ��ʂ̓����x��ݒ肷��(MacVim)
set transparency=10

"---------------------------------------------------------------------------

" �r�W���A���I��(D&D��)�������I�ɃN���b�v�{�[�h�� (:help guioptions_a)
set guioptions+=a

"���̓��[�h���A�X�e�[�^�X���C���̃J���[��ύX
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
"augroup END

"---------------------------------------------------
"�r�[�v������(�t���b�V���g�p�͖����� t_vb=�폜)
set visualbell t_vb=

" --------------------------------------------------
" ���͎��̃J�[�\���̐F��ݒ�
if has('multi_byte_ime') || has('xim')
    " ���{�����ON���̃J�[�\���̐F��ݒ�
    highlight CursorIM guibg=Purple guifg=NONE
endif

