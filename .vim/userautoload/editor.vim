set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode

" :Fmt などで gofmt の代わりに goimports を使う
let g:gofmt_command = 'goimports'
" Go に付属の plugin と gocode を有効にする
set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
set rtp+=$GOROOT/misc/vim
