set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set showmode       " Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表示する
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮" 不可視文字の表示記号指定

set hlsearch       "検索文字列をハイライトする
set incsearch      "インクリメンタルサーチを行う
set ignorecase     "大文字と小文字を区別しない
set smartcase      "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan       "最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault       "置換の時 g オプションをデフォルトで有効にする
set confirm        "保存されていないファイルがあるときは終了前に保存確認
set hidden         "保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread       "外部でファイルに変更がされた場合は読みなおす
set nobackup       "ファイル保存時にバックアップファイルを作らない
set noswapfile     "ファイル編集中にスワップファイルを作らない
set backspace=indent,eol,start "Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,] "行頭行末の左右移動で行をまたぐ
set scrolloff=8                "上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う
set nocompatible
set showcmd         " Show partial commands in the last line of the screen
set hlsearch        " Highlight searches (use <C-L> to temporarily turn off highlighting; see the
set ruler
set clipboard=unnamedplus,unnamed
