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
nmap ;y :YRShow<CR>

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

"------------------------------------
" neosnippet
"------------------------------------
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
"
" neosnippet "{{{
let s:default_snippet = neobundle#get_neobundle_dir() . '/neosnippet/autoload/neosnippet/snippets' " 本体に入っているsnippet
let s:my_snippet = '~/snippet' " 自分のsnippet
" let g:neosnippet#snippets_directory = s:my_snippet
let g:neosnippet#snippets_directory = s:default_snippet . ',' . s:my_snippet
inoremap <silent><C-U>            <ESC>:<C-U>Unite snippet<CR>
nnoremap <silent><Space>e         :<C-U>NeoSnippetEdit -split<CR>
smap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
" xmap <silent>o                    <Plug>(neosnippet_register_oneshot_snippet)
"}}

NeoBundleLazy 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
NeoBundle 'vim-ruby/vim-ruby'

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
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
nnoremap <silent> <C-u>y :<C-u>Unite history/yank<CR>
nnoremap <silent> <C-u>b :<C-u>Unite buffer<CR>
nnoremap <silent> <C-u>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-u>nf :<C-u>Unite file file/new -buffer-name=file<CR>
nnoremap <silent> <C-u>re :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <C-u>u :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> <C-u>ud :<C-u>Unite directory_mru buffer<CR>
nnoremap <silent> <C-u>g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <C-u>cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> <C-u>r  :<C-u>UniteResume search-buffer<CR>
"rails setting must rails root vim start
nnoremap <silent> <C-u>ff  :<C-u>Unite file<CR>
nnoremap <silent> <C-u>c :<C-u>Unite file_rec/async:app/controllers/ <CR>
nnoremap <silent> <C-u>nc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> <C-u>m :<C-u>Unite file_rec/async:app/models/ <CR>
nnoremap <silent> <C-u>nm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> <C-u>v :<C-u>Unite file_rec/async:app/views/ <CR>
nnoremap <silent> <C-u>nv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> <C-u>s :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap <silent> <C-u>ns :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> <C-u>j :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap <silent> <C-u>nj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> <C-u>o :<C-u>Unite file_rec/async:config/ <CR>
nnoremap <silent> <C-u>no :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> <C-u>d :<C-u>Unite file_rec/async:db/migrate/ <CR>
nnoremap <silent> <C-u>nd :<C-u>Unite file file/new -input=db/migrate/ <CR>
nnoremap <silent> <C-u>l :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap <silent> <C-u>nl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> <C-u>t :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap <silent> <C-u>nt :<C-u>Unite file file/new -input=spec/ <CR>
nnoremap <silent> <C-u>h :<C-u>Unite file_rec/async:app/helpers/ <CR>
nnoremap <silent> <C-u>nh :<C-u>Unite file file/new -input=app/helpers/ <CR>
nnoremap <silent> <C-u>se :<C-u>Unite file_rec/async:db/seeds.rb <CR>
nnoremap <silent> <C-u>p :<C-u>Unite file_rec/async:app/presenters/ <CR>
nnoremap <silent> <C-u>np :<C-u>Unite file file/new -input=app/presenters/ <CR>
" ファイルを開く時、ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
"------------------------------------
" Unite-rails.vim
"------------------------------------
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
"{{{
function! UniteRailsSetting()
"  nnoremap <silent><C-u>v           :<C-U>Unite rails/view<CR>
"  nnoremap <silent><C-u>m           :<C-U>Unite rails/model<CR>
"  nnoremap <buffer><C-u>c           :<C-U>Unite rails/controller<CR>
"  nnoremap <buffer><C-u>o           :<C-U>Unite rails/config<CR>
"  nnoremap <buffer><C-u>s           :<C-U>Unite rails/spec<CR>
"  nnoremap <buffer><C-u>d           :<C-U>Unite rails/db -input=migrate<CR>
"  nnoremap <buffer><C-u>l           :<C-U>Unite rails/lib<CR>
"  nnoremap <buffer><expr><C-u>g     ':e '.b:rails_root.'/Gemfile<CR>'
"  nnoremap <buffer><expr><C-u>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
"  nnoremap <buffer><expr><C-u>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
"  nnoremap <buffer><C-u>ra          :<C-U>Unite rails/rake<CR>
"  nnoremap <buffer><C-u>h           :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END
"}}}

NeoBundle 'romanvbabenko/rails.vim'
let g:rails_statusline = 0

NeoBundle 'Shougo/neomru.vim'
NeoBundleLazy 'taka84u9/vim-ref-ri', {
      \ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref']}
      "\ 'autoload': { 'filetypes': g:my.ft.ruby_files } }
NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}
NeoBundleLazy 'alpaca-tc/alpaca_tags', {
              \    'depends': ['Shougo/vimproc'],
              \    'autoload' : {
              \       'commands' : [
              \          { 'name' : 'AlpacaTagsBundle', 'complete': 'customlist,alpaca_tags#complete_source' },
              \          { 'name' : 'AlpacaTagsUpdate', 'complete': 'customlist,alpaca_tags#complete_source' },
              \          'AlpacaTagsSet', 'AlpacaTagsCleanCache', 'AlpacaTagsEnable', 'AlpacaTagsDisable', 'AlpacaTagsKillProcess', 'AlpacaTagsProcessStatus',
              \       ],
              \    }
              \ }
let g:alpaca_tags#config = {
                       \    '_' : '-R --sort=yes',
                       \    'ruby': '--languages=+Ruby',
                       \ }
augroup AlpacaTags
  autocmd!
  if exists(':AlpacaTags')
    autocmd BufWritePost Gemfile AlpacaTagsBundle
    autocmd BufEnter * AlpacaTagsSet
    autocmd BufWritePost * AlpacaTagsUpdate
  endif
augroup END

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

NeoBundle 'vim-scripts/vim-auto-save'
let g:auto_save = 1
let g:session_autoload = 'no'                                                      
let g:session_autosave = 'yes'                                                     
let g:session_autosave_periodic = 3  
" データベース操作
NeoBundle 'vim-scripts/dbext.vim'
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

" ------------------------------------
" switch.vim
" ------------------------------------
NeoBundle 'AndrewRadev/switch.vim'
nnoremap - :Switch<CR>
let s:switch_definition = {
      \ '*': [
      \   ['is', 'are']
      \ ],
      \ 'ruby,eruby,haml' : [
      \   ['if', 'unless'],
      \   ['while', 'until'],
      \   ['.blank?', '.present?'],
      \   ['include', 'extend'],
      \   ['class', 'module'],
      \   ['.inject', '.delete_if'],
      \   ['.map', '.map!'],
      \   ['attr_accessor', 'attr_reader', 'attr_writer'],
      \ ],
      \ 'Gemfile,Berksfile' : [
      \   ['=', '<', '<=', '>', '>=', '~>'],
      \ ],
      \ 'ruby.application_template' : [
      \   ['yes?', 'no?'],
      \   ['lib', 'initializer', 'file', 'vendor', 'rakefile'],
      \   ['controller', 'model', 'view', 'migration', 'scaffold'],
      \ ],
      \ 'erb,html,php' : [
      \   { '<!--\([a-zA-Z0-9 /]\+\)--></\(div\|ul\|li\|a\)>' : '</\2><!--\1-->' },
      \ ],
      \ 'rails' : [
      \   [100, ':continue', ':information'],
      \   [101, ':switching_protocols'],
      \   [102, ':processing'],
      \   [200, ':ok', ':success'],
      \   [201, ':created'],
      \   [202, ':accepted'],
      \   [203, ':non_authoritative_information'],
      \   [204, ':no_content'],
      \   [205, ':reset_content'],
      \   [206, ':partial_content'],
      \   [207, ':multi_status'],
      \   [208, ':already_reported'],
      \   [226, ':im_used'],
      \   [300, ':multiple_choices'],
      \   [301, ':moved_permanently'],
      \   [302, ':found'],
      \   [303, ':see_other'],
      \   [304, ':not_modified'],
      \   [305, ':use_proxy'],
      \   [306, ':reserved'],
      \   [307, ':temporary_redirect'],
      \   [308, ':permanent_redirect'],
      \   [400, ':bad_request'],
      \   [401, ':unauthorized'],
      \   [402, ':payment_required'],
      \   [403, ':forbidden'],
      \   [404, ':not_found'],
      \   [405, ':method_not_allowed'],
      \   [406, ':not_acceptable'],
      \   [407, ':proxy_authentication_required'],
      \   [408, ':request_timeout'],
      \   [409, ':conflict'],
      \   [410, ':gone'],
      \   [411, ':length_required'],
      \   [412, ':precondition_failed'],
      \   [413, ':request_entity_too_large'],
      \   [414, ':request_uri_too_long'],
      \   [415, ':unsupported_media_type'],
      \   [416, ':requested_range_not_satisfiable'],
      \   [417, ':expectation_failed'],
      \   [422, ':unprocessable_entity'],
      \   [423, ':precondition_required'],
      \   [424, ':too_many_requests'],
      \   [426, ':request_header_fields_too_large'],
      \   [500, ':internal_server_error'],
      \   [501, ':not_implemented'],
      \   [502, ':bad_gateway'],
      \   [503, ':service_unavailable'],
      \   [504, ':gateway_timeout'],
      \   [505, ':http_version_not_supported'],
      \   [506, ':variant_also_negotiates'],
      \   [507, ':insufficient_storage'],
      \   [508, ':loop_detected'],
      \   [510, ':not_extended'],
      \   [511, ':network_authentication_required'],
      \ ],
      \ 'rspec': [
      \   ['describe', 'context', 'specific', 'example'],
      \   ['before', 'after'],
      \   ['be_true', 'be_false'],
      \   ['get', 'post', 'put', 'delete'],
      \   ['==', 'eql', 'equal'],
      \   { '\.should_not': '\.should' },
      \   ['\.to_not', '\.to'],
      \   { '\([^. ]\+\)\.should\(_not\|\)': 'expect(\1)\.to\2' },
      \   { 'expect(\([^. ]\+\))\.to\(_not\|\)': '\1.should\2' },
      \ ],
      \ 'markdown' : [
      \   ['[ ]', '[x]']
      \ ]
      \ }
 
nnoremap + :call switch#Switch(s:switch_definition)<cr>

NeoBundle 'scrooloose/syntastic'
let g:syntastic_ruby_rubocop_exec = 'RBENV_VERSION=2.1.5 /Users/sasajimay/.rbenv/shims/rubocop'
" Installation check.
if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
                    \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
"finish
endif
