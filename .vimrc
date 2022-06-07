syntax on
"set nowrap
language C
"set background=light
set background=dark
"set number
"set ignorecase
set shortmess+=I
"set visualbell
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set noswapfile
set nobackup
set noincsearch
set hlsearch
if has("gui_running")
  set lines=50 columns=90
  set mouse=a
  set ttymouse=xterm2
else
  set mouse=""
  set clipboard+=unnamed,autoselect
  nnoremap <Up> <Nop>
  nnoremap <Down> <Nop>
  nnoremap <C-Up> <Nop>
  nnoremap <C-Down> <Nop>
endif

" C/C++ でラベルでインデントを深くされたくない
set cinoptions+=:0,g0

nnoremap <C-l>  <Esc>:nohlsearch<CR>
nnoremap <C-s>l <Esc>:set number<CR>
nnoremap <C-s>L <Esc>:set nonumber<CR>
nnoremap <C-s>h <Esc>:set cursorline<CR>
nnoremap <C-s>H <Esc>:set nocursorline<CR>
nnoremap <C-s>v <Esc>:set cursorcolumn<CR>
nnoremap <C-s>V <Esc>:set nocursorcolumn<CR>

"nnoremap :windo set scrollbind<CR>

"" gtags
"" カレントファイルの関数一覧
"noremap <C-g>f :Gtags -f %<CR>
"
"" カーソル位置の定義元
"noremap <C-g>j :GtagsCursor<CR>
"
"" カーソル位置の参照箇所
"noremap <C-g>r :Gtags -r <C-r><C-w><CR>
"
"" 次の検索結果へジャンプ
"noremap <C-g>n :cn<CR>
"
"" 前の検索結果へジャンプ
"noremap <C-g>p :cp<CR>

set ruler
set nowrapscan
set autoindent
"set ffs=unix
if has('win32')
  let $LANG='ja_JP.UTF-8'
  set encoding=japan
  set fileencoding=japan
else
  set fileencoding=utf-8
  set encoding=utf-8
endif
set termencoding=utf-8
set fileencodings=utf-8,cp932,iso-2022-jp

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" インデントでコメントを継続しないようにする
if has("autocmd")
  autocmd FileType *
  \ let &l:comments
  \=join(filter(split(&l:comments, ','), 'v:val =~ "^[sme]"'), ',')
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" set statusline=%f%m%r%h%w\ [NL=%{&ff}]\ [TYPE=%Y]\ [HEX=\%02.2B]\ [COLUMN=%v][ROW=%l/%L]\ [%p%%]
set statusline=%f%m%r%h%w\ NL=%{&ff}\ ENC=%{&fileencoding}\ COL=%c\ ROW=%l/%L\ %p%%
set laststatus=2

highlight DiffAdd    cterm=bold ctermfg=white ctermbg=blue
highlight DiffDelete cterm=bold ctermfg=white ctermbg=magenta
highlight DiffChange cterm=bold ctermfg=black ctermbg=gray
highlight DiffText   cterm=bold ctermfg=white ctermbg=red
highlight Search ctermfg=white ctermbg=darkcyan
highlight PreProc term=bold cterm=bold ctermfg=white
"highlight statusline term=NONE cterm=NONE guifg=red ctermfg=black ctermbg=gray
highlight statusline term=NONE cterm=NONE ctermfg=white ctermbg=blue
highlight statuslinenc term=NONE cterm=NONE ctermfg=white ctermbg=gray
"highlight MatchParen ctermfg=black ctermbg=white cterm=bold
set matchtime=1
highlight MatchParen ctermfg=blue ctermbg=black cterm=bold
"let loaded_matchparen=1 " 対応括弧の強調表示をやめる

augroup MyGroup
  autocmd!
  autocmd BufRead,BufNewFile *.go setlocal noexpandtab ts=4 sw=4 sts=4
  autocmd BufRead,BufNewFile *.c setlocal expandtab ts=2 sw=2 sts=2
  autocmd BufRead,BufNewFile *.h setlocal expandtab ts=2 sw=2 sts=2
  autocmd BufRead,BufNewFile *.cpp setlocal expandtab ts=2 sw=2 sts=2
  autocmd BufRead,BufNewFile *.hpp setlocal expandtab ts=2 sw=2 sts=2
  autocmd BufRead,BufNewFile *.cxx setlocal expandtab ts=2 sw=2 sts=2
  autocmd BufRead,BufNewFile *.cc setlocal expandtab ts=2 sw=2 sts=2
  autocmd BufRead,BufNewFile *.hh setlocal expandtab ts=2 sw=2 sts=2
  autocmd BufRead,BufNewFile *.py setlocal expandtab ts=4 sw=4 sts=4
  autocmd BufRead,BufNewFile *.nim setlocal expandtab ts=2 sw=2 sts=2
  autocmd BufRead,BufNewFile *.rs setlocal expandtab ts=4 sw=4 sts=4
augroup END
