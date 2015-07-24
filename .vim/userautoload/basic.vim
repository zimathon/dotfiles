set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
"set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮" 不可視文字の表示記号指定
set expandtab      "タブ入力を複数の空白入力に置き換える
set tabstop=2      "画面上でタブ文字が占める幅
set softtabstop=2  "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
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
set whichwrap=b,s,h,l,<,>,[,]  "行頭行末の左右移動で行をまたぐ
set scrolloff=8                "上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う
set tw=0            "勝手に自動改行されるのを回避
set formatoptions=q
"set paste
set autoindent
set nocompatible
nnoremap n nzz
nnoremap N Nzz
set wildmenu        " Better command-line completion
set showcmd         " Show partial commands in the last line of the screen
set hlsearch        " Highlight searches (use <C-L> to temporarily turn off highlighting; see he
set ruler
set clipboard+=unnamed,autoselect
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
      set paste
      return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif
autocmd QuickFixCmdPost *grep* cwindow
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorcolumn
  autocmd CursorHold,CursorHoldI * setlocal cursorcolumn
augroup ND
