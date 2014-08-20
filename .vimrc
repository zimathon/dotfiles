" Vi互換OFF 
set nocompatible
<<<<<<< HEAD
filetype off
=======
set wildmenu        " Better command-line completion
set showcmd         " Show partial commands in the last line of the screen
set hlsearch        " Highlight searches (use <C-L> to temporarily turn off highlighting; see the
set ruler
set clipboard=unnamed,autoselect
set relativenumber  " 相対行番号を有効にする
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END
syntax on
"--------------------------------------------------------------------------
" go
if $GOROOT !=''
	set rtp+=$GOROOT/misc/vim
endif
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
"--------------------------------------------------------------------------
" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!
>>>>>>> 874a9595a47028845127b4c5c65c1b175fb4977b

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'

" ファイル形式別プラグインのロードを有効化
filetype plugin on
filetype indent on
 
" 分割した設定ファイルをすべて読み込む
set runtimepath+=~/.vim/
runtime! userautoload/*.vim
