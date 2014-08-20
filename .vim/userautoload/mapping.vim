"-------------------------------------------------
" Move 移動設定
"-------------------------------------------------
" insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap jj <Esc>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>
