"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开始使用Vundle的必须配置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"
Bundle 'gmarik/vundle'

" airline 美化命令行
Bundle 'bling/vim-airline'
let g:airline_extensions_tabline_enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

" 快速移动
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'
" let g:EasyMotion_leader_key = 'f'

" NERD 目录浏览器
Bundle 'scrooloose/nerdtree'
map <Leader>o :NERDTreeToggle<CR>

" NERD 注释
Bundle 'The-NERD-Commenter'

" 查找文件
Bundle 'kien/ctrlp.vim'

"
Bundle 'UltiSnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Markdown
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

" 让代码更加易于纵向排版，以=或,符号对齐
Bundle 'Tabular'

"
Bundle 'Townk/vim-autoclose'

" 启动智能补全
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/mswin.vim
behave mswin

" 不要备份文件（根据自己需要取舍）
set nobackup
set nowb
" 不要生成swap文件，当buffer被丢弃的时候隐藏它
set noswapfile
set whichwrap+=<,>,h,l
" 自动载入配置文件
"autocmd! bufwritepost _vimrc source %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置,彻底解决中文乱码问题
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if has("win32")
	set fileencoding=chinese
else
	set fileencoding=utf-8
endif
let &termencoding=&encoding
" 解决菜单乱码
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决consle输出乱码
language messages zh_CN.utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 界面
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess=atI
set showcmd
set lines=45
set columns=120
" 键入时隐藏鼠标
set mousehide
" 隐藏工具栏
set guioptions-=T
" 隐藏菜单栏
set guioptions-=m
" 窗口最大化
"au GUIEnter * simalt ~x 
" 语法高亮
syntax enable
syntax on
" 显示行号
"set nu!
set rnu
set lbr
" 配色方案
color desert 
"set guifont=新宋体:h10
"set gfn=微软雅黑\ Monaco:h12
"set gfn=Droid\ Sans\ Mono\ for\ Powerline:h10
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12

" 高亮当前行
if has("gui_running")
	set cursorline
	" hi cursorline guibg=#dddddd
endif
" 总是显示状态栏
set laststatus=2
"状态栏颜色
"hi Statusline guifg=#888888 guibg=white 
"hi StatuslineNC guifg=Gray guibg=white 
"highlight Pmenu guifg=black guibg=#cccccc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set autoread
set wildmenu
" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来
set history=1024
" 禁用声音
set noerrorbells
set novisualbell
set t_vb=
" 显示当前模式
set showmode
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
set cmdheight=2
"允许在有未保存的修改时切换缓冲区，此时的修改由vim负责保存
set hidden
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置行距
set linespace =1
" 不自动换行
set nowrap
" 自动格式化
set formatoptions=tcrqn
" 继承前一行的缩进方式，特别适用于多行注释
set autoindent
"开启新行时使用智能自动缩进
set smartindent
" 使用C样式的缩进
set cindent
" 制表符为4
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
"　设置Tab样式
"set listchars=tab:>>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch
"关闭循环
"set nowrapscan 
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5
" 在搜索的时候忽略大小写
set ignorecase 
set smartcase
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch
" Set magic on
set magic
"How many tenths of a second to blink
set mat=4
"高亮搜索
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"快捷键设置 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"leader
let g:mapleader = ";"

map <F2> :e ~/_vimrc<CR>

"GCC
if has('gui_macvim')
	imap <F1> <Esc>:w<CR>:!gcc -std=c99 % -o %< && ./%< <CR>
	map <F1> <Esc>:w<CR>:!gcc -std=c99 % -o %< && ./%< <CR>
elseif has('win32')
	imap <F1> <Esc>:w<CR>:!gcc -std=c99 -Wl,-enable-auto-import % -g -o %<.exe && %<.exe<CR>
	map <F1> <Esc>:w<CR>:!gcc -std=c99 -Wl,-enable-auto-import % -g -o %<.exe && %<.exe<CR>
endif
imap <C-D> <Esc>cc
imap jk <Esc>

imap <D-j> <Esc>ji
imap <D-k> <Esc>ki
imap <D-l> <Esc>li
imap <D-h> <Esc>hi

"循环切换相对/绝对行号 
function! ToggleLine()
	if(&relativenumber==1)
		set nornu
		set nu
	else
		set nonu
		set rnu
	endif
endfunc
map <F5> <Esc>:call ToggleLine()<CR>
