"=========================
" 兼容处理
"
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" make bs woking like normal
set backspace=indent,eol,start
set nofoldenable

"=========================
" 文本处理
"
" file encode
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030,ucs-bom,cp936,big5,euc-jp,euc-kr,latin1
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8
set fileformats=unix,dos,mac
" 处理consle输出乱码, use silent! prevent show error msg on some OS
silent! language messages zh_CN.UTF-8
set langmenu=zh_CN.UTF-7
set helplang=cn
" 回行
set wrap
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\  "注释
set list
set listchars=eol:¬,tab:▸\ ,trail:•,nbsp:␣,extends:»,precedes:«
if has('nvim')
  set listchars+=space:.
  " enable neovim true color support
  silent! set termguicolors
endif
set diffopt+=vertical,context:3,foldcolumn:0
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%
" 自动格式化
set formatoptions=tcrqn
" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
if has('nvim') || has('patch584')
  " Delete comment character when joining commented lines
  set formatoptions+=j
end
" 合并两行中文时，不在中间加空格：
set formatoptions+=B
" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

" Don't reset cursor to start of line when moving around
set nostartofline

" 匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>

" disable matchparen plugin, this option will slow down vim in some conditions
let loaded_matchparen = 1
"=========================
"编辑
"
"Whitespace
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

"=========================
"Basic UI
"
" 命令行（在状态行下）的高度，默认为1(不显示状态栏)，这里是2
set laststatus=2
" nu
set nu
set numberwidth=4

"colorcolumn
set colorcolumn=90
highlight ColorColumn ctermbg=darkgray

" 开启高亮语法显示
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
syntax sync minlines=50 maxlines=90
set synmaxcol=300

" 高亮关键词汇
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\|FUCK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')

" change the terminal's title
set title
" 关闭错误信息响铃
set noerrorbells
" 关闭使用可视响铃代替呼叫
set novisualbell
" 置空错误铃声的终端代码
set t_vb=

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=15
set sidescrolloff=1

"===========================
" command line
"

" display incomplete commands
set showcmd
" Show current mode
set showmode
" 在编辑过程中，在右下角显示光标位置的状态行
" show the cursor position all the time
set ruler
" 设定命令行的行数为 1
set cmdheight=1
" 历史记录数
set history=100
"" Wildmode
""
" 增强模式中的命令行自动完成操作,在输入命令时列出匹配项目，也就是截图底部的效果
" this option is default in neovim
set wildmenu
" this option is default in neovim
set wildmode=list:longest,full
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable binary files
set wildignore+=*.dll,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Ignore node modules
set wildignore+=node_modules/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" files or directoies auto completion is case insensitive
set wildignorecase


"" Search
""
" 输入搜索内容时就显示搜索结果
set incsearch
" 高亮被搜索的句子（phrases）
set hlsearch
" 搜索或者补全时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 禁止在搜索到文件两端时重新搜索
set nowrapscan
" 行内替换
" set gdefault

" Fast remove highlight search
" 去掉搜索高亮 search/symbol highlight persist remove
" nnoremap <leader>sc :set hlsearch! hlsearch?<CR>
" temporarily disable search highlighting until the next search
nnoremap <leader>sc :nohlsearch<CR>

"============================
" Buffers
"
" {{{不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set nobackup
" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden  "隐藏buff非关闭它
set bufhidden=hide
" }}}
" 设置当文件被外部改变的时候自动读入文件
set autoread

"============================
" Performance
"
" Optimize for fast terminal connections
" this option is default in neovim, and removed
set ttyfast
" use old version re engine
set re=1
set lazyredraw

set re=1


" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=100

let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

"============================
" plug
"
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'Shougo/echodoc'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Initialize plugin system
call plug#end()
filetype plugin indent on

"==========================
" advance UI
"
colorscheme gruvbox
set background=dark
let g:airline_theme= 'luna'
" autocmd VimEnter * AirlineTheme luna

"=========================
" LSP
"
set hidden
let g:LanguageClient_autoStart = 1
let g:LanguageClient_hoverPreview = "Never"
let g:LanguageClient_hasSnippetSupport = 0
set completeopt-=preview

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls', '--log-file=/tmp/LanguageServer.log'],
    \ 'go': ['gopls', '-debug'],
    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> ca :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> pep :call LanguageClient#textDocument_formatting()<CR>

" Go
let g:go_def_mode='gopls'


augroup LanguageClient_config
  au!
  au BufEnter * let b:Plugin_LanguageClient_started = 0
  au User LanguageClientStarted setl signcolumn=yes
  au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
  au User LanguageClientStopped setl signcolumn=auto
  au User LanguageClientStopped let b:Plugin_LanguageClient_stopped = 0
  au CursorMoved * if b:Plugin_LanguageClient_started | sil call LanguageClient#textDocument_documentHighlight() | endif
augroup END

"=======================
" INTEL
"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
set noshowmode
let g:echodoc#enable_at_startup = 1


"======================
" key bindings
"
" Basic cursor movement and deletion keybindings from emacs, for vim.

" insert mode
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill_line()<CR>

" command line mode
cmap <C-p> <Up>
cmap <C-n> <Down>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-k> <C-f>D<C-c><C-c>:<Up>

" command-T window
let g:CommandTCursorLeftMap  = ['<Left>',  '<C-b>']
let g:CommandTCursorRightMap = ['<Right>', '<C-f>']
let g:CommandTBackspaceMap   = ['<BS>',    '<C-h>']
let g:CommandTDeleteMap      = ['<Del>',   '<C-d>']

function! s:home()
  let start_col = col('.')
  normal! ^
  if col('.') == start_col
    normal! 0
  endif
  return ''
endfunction

function! s:kill_line()
  let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
  if len(text_after_cursor) == 0
    normal! J
  else
    call setline(line('.'), text_before_cursor)
  endif
  return ''
endfunction

function! s:split_line_text_at_cursor()
  let line_text = getline(line('.'))
  let text_after_cursor  = line_text[col('.')-1 :]
  let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before_cursor, text_after_cursor]
endfunction

