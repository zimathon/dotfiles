set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える
set expandtab      "タブ入力を複数の空白入力に置き換える
set noexpandtab    " Insertモードで <Tab> を挿入するのに、適切な数の空白を使う
set tabstop=2      "画面上でタブ文字が占める幅
set shiftwidth=2   "自動インデントでずれる幅
set softtabstop=2  "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set wildmenu        " Better command-line completion
"補完モード
" ""               "最初のマッチのみを補完する。
" "full"           " 次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び最初のマッチが補完される
" "longest"        " 共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る
" "longest:full"  "longest" と似ているが、'wildmenu'が有効ならばそれを開始する
" "list"          "複数のマッチがあるときは、全てのマッチを羅列する。
" "list:full"     " 複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する
" "list:longest"  " 複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完される
set wildmode=list:longest,full
" ---------------------------------------------
" Ricty
" ---------------------------------------------
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode
