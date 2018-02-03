NeoBundle 'Lokaltog/vim-easymotion'
"ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
"「;」 + 何かにマッピング
let g:EasyMotion_leader_key=";"
"1ストローク選択を優先する
let g:EasyMotion_grouping=1
"カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
if has("lua")
      NeoBundleLazy 'Shougo/neocomplete', { 'autoload' : {
            \   'insert' : 1,
            \ }}
endif
if neobundle#is_installed('neocomplete')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'scala' : $HOME . '/.vim/dict/scala.dict',
    \ }
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'vim-scripts/vim-auto-save'
let g:auto_save = 1
let g:session_autoload = 'no'                                                      
let g:session_autosave = 'yes'                                                     
let g:session_autosave_periodic = 3  
let g:auto_save_in_insert_mode = 0
NeoBundle 'errormarker.vim' 

function! s:separate_defenition_to_each_filetypes(ft_dictionary) "{{{
  let result = {}
 
  for [filetypes, value] in items(a:ft_dictionary)
    for ft in split(filetypes, ",")
      if !has_key(result, ft)
        let result[ft] = []
      endif
 
      call extend(result[ft], copy(value))
    endfor
  endfor
 
  return result
endfunction"}}}

NeoBundle 'nathanaelkane/vim-indent-guides'

if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
                    \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
"finish
endif
