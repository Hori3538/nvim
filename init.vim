syntax enable
set clipboard+=unnamedplus
set virtualedit=onemore
" deoplete
let g:deoplete#enable_at_startup = 1
set wildmode=list:longest
colorscheme molokai
"行番号を表示
set number
"tabを可視化
set list listchars=tab:\▸\-
"tab文字を半角スペースにする
set expandtab
"行頭以外のtab文字の表示幅(スペースいくつ分か)
set tabstop=4
"行頭のtab文字の表示幅(スペースいくつ分か)
set shiftwidth=4
" 貼付け時tabを入れない
set paste
" insertモードでjjをEscとして扱う
inoremap jj <Esc>
"行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" スワップファイルを作らない
set noswapfile
"ペーストモードを解除
set nopaste
"括弧閉じの自動補完
inoremap { {}<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<LEFT>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
"クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
"[]の補完
inoremap [ []<LEFT>
if &compatible
   set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif
if dein#check_install()
    call dein#install()
endif
filetype plugin indent on
syntax enable
