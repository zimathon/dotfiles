set nocompatible
filetype off 

" ファイル形式別プラグインのロードを有効化
filetype plugin on
filetype indent on
" 分割した設定ファイルをすべて読み込む
set runtimepath+=~/.vim/
runtime! ~/.vim/userautoload/*.vim
