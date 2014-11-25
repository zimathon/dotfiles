"-------------------------------------------------
" Move 移動設定
"-------------------------------------------------
" insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-b> <Left>
inoremap <C-l> <Right>
inoremap <C-f> <Right>
inoremap jj <Esc>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>
" 削除キーでyankしない
nnoremap x "_x
"nnoremap d "_d
nnoremap D "_D
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
