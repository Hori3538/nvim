syntax enable
set clipboard+=unnamedplus
set virtualedit=onemore
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
" "括弧閉じの自動補完
" inoremap { {}<LEFT>
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap ( ()<LEFT>
" inoremap (<Enter> ()<Left><CR><ESC><S-o>
" "クオーテーションの補完
" inoremap ' ''<LEFT>
" inoremap " ""<LEFT>
" "[]の補完
" inoremap [ []<LEFT>

set completeopt=menuone,noinsert
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

" 削除キーでyankしない
" nnoremap x "_x
" nnoremap d "_d
" nnoremap D "_D

"" coc.nvim
""" <Tab>で候補をナビゲート
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
""" <Tab>で次、<S+Tab>で前
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" vim-plug なかったら落としてくる
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 足りないプラグインがあれば :PlugInstall を実行
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('$HOME/.local/share/nvim/plugged')
Plug 'tomasr/molokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'Shougo/deoplete.nvim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'rust-lang/rust.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim'

call plug#end()

" nnoremap <silent><C-n> :NERDTreeToggle<CR>
" Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>"
