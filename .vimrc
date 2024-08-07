set encoding=utf-8
set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim
set noswapfile
set nobackup
set noundofile
set clipboard+=unnamed
set number
set nowrap
set hlsearch!
nnoremap <F3> :set hlsearch!<CR>

" call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle 'Shougo/neobundle.vim'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'chriskempson/vim-tomorrow-theme'

" 分割した設定ファイルをすべて読み込む
set runtimepath+=~/.vim/
" runtime! userautoload/*.vim

"call neobundle#end()

" ファイル形式別プラグインのロードを有効化
filetype plugin on
filetype indent on
