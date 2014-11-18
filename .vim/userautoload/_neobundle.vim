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

NeoBundle 'YankRing.vim'
nmap ,y :YRShow<CR>

NeoBundle 'mbbill/undotree'
"undo履歴を表示する。? でヘルプを表示
nmap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"

NeoBundle 'troydm/easybuffer.vim'
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
  " neocomplete用設定
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

NeoBundleLazy 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}

NeoBundleLazy 'alpaca-tc/vim-endwise.git' ,{
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \ 'mappings' : ['nx', '%'] }}

NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
"rails setting must rails root vim start
noremap <silent> ,urc :<C-u>Unite file_rec/async:app/controllers/ <CR>
nnoremap <silent> ,urfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> ,urm :<C-u>Unite file_rec/async:app/models/ <CR>
nnoremap <silent> ,urfm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> ,urv :<C-u>Unite file_rec/async:app/views/ <CR>
nnoremap <silent> ,urfv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> ,urs :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap <silent> ,urfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> ,urj :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap <silent> ,urfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> ,uro :<C-u>Unite file_rec/async:config/ <CR>
nnoremap <silent> ,urfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> ,url :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap <silent> ,urfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> ,urr :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap <silent> ,urfr :<C-u>Unite file file/new -input=spec/ <CR>
function! s:unite_my_settings()"{{{
  " ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction"}}}

NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/neomru.vim'

NeoBundle 'ujihisa/unite-colorscheme'
NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}

NeoBundleLazy 'taka84u9/vim-ref-ri', {
      \ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref']}
      "\ 'autoload': { 'filetypes': g:my.ft.ruby_files } }

NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['TagsUpdate', 'TagsSet', 'TagsBundle']
      \ }}

NeoBundleLazy 'tsukkee/unite-tag', {
      \ 'depends' : ['Shougo/unite.vim'],
      \ 'autoload' : {
      \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
      \ }}

NeoBundle 'mattn/emmet-vim'
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'filters' : 'html',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'extends' : 'html',
      \   'filters' : 'html',
      \ },
      \}
augroup EmmitVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
augroup END

NeoBundle 'open-browser.vim'
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Lokaltog/powerline-fontpatcher'
NeoBundle 'flazz/vim-colorschemes'

" git
NeoBundle 'tpope/vim-fugitive.git'
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

NeoBundle 'gregsexton/gitv.git'
" golang
NeoBundle 'fatih/vim-go'

NeoBundle 'airblade/vim-gitgutter'
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

" Installation check.
if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
                    \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
"finish
endif
