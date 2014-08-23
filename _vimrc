"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"开始使用Vundle的必须配置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

"airline 美化命令行
Plugin 'bling/vim-airline'
let g:airline_extensions_tabline_enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

"快速移动
Plugin 'Lokaltog/vim-easymotion'
"let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_leader_key = ';'

"NERD 目录浏览器
Plugin 'scrooloose/nerdtree'
map <Leader>o :NERDTreeToggle<CR>

"NERD 注释
Plugin 'The-NERD-Commenter'

"查找文件
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"自动生成代码
Plugin 'UltiSnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Markdown
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

"让代码更加易于纵向排版，以=或,符号对齐
Plugin 'Tabular'

"自动闭合括号
Plugin 'Townk/vim-autoclose'
let g:AutoClosePairs_del = "`"

if has('gui_macvim')
	Plugin 'Rip-Rip/clang_complete'
	let g:clang_auto_select = 1
	let g:clang_complete_auto = 1
endif

call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! HasOS(name)
	if a:name == "mac"|| a:name == "linux"
		let uname = system("uname")
		if a:name == "mac"
			return uname == "Darwin\n"
		else
			return uname == "Linux\n"
		endif
	endif
	return has(a:name)
endfunction

function! HasGUI()
	return has("gui_running")
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/mswin.vim
behave mswin
" 插入模式输入中文完毕回到普通模式时禁用输入法
"se imd
"au InsertEnter * se imd
"au InsertLeave * se noimd
"au FocusGained * se imd

"在切换到 normal,insert,search 模式时使用英文输入法
"set noimdisable
"set iminsert=1
"set imsearch=0

"开打文件鼠标自动到上次编辑位置
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不要备份文件（根据自己需要取舍）
set nobackup
set nowb
" 不要生成swap文件，当buffer被丢弃的时候隐藏它
set noswapfile
set whichwrap+=<,>,h,l
" 自动载入配置文件
"autocmd! bufwritepost _vimrc source %
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" windows 下编码设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"编码设置,彻底解决中文乱码问题
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
set lines=45
set columns=120
"启用鼠标
if has('mouse')
  set mouse=a
endif
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
if has("gui_running")
	" 高亮当前行
	set cursorline
	if has('win32')
		set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12
	elseif has('gui_macvim')
		set guifont=Droid\ Sans\ Mono\ for\ Powerline:h10
	else
		set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
	endif
endif
" 总是显示状态栏
set laststatus=2
"
set shortmess=atI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set autoread
set wildmenu
" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来
set showcmd
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
" 添加水平滚动条
"set guioptions+=b
" 不自动换行
set nowrap
" 自动格式化
"set formatoptions=tcrqn
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
" 设置每行120个字符自动换行
"set textwidth=120
"
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
"快捷键设置 Key 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"leader
"
let g:mapleader = ";"

map <F2> :e ~/_vimrc<CR>

"GCC
if has('gui_macvim')
	imap <F1> <Esc>:w<CR>:!mycc -std=c99 -Wall -enable-auto-import % -g -o %< && ./%< <CR>
	map <F1> <Esc>:w<CR>:!mycc -std=c99 -Wall -enable-auto-import % -g -o %< && ./%< <CR>
	"
	"imap <D-j> <Esc>ji
	"imap <D-k> <Esc>ki
	"imap <D-l> <Esc>li
	"imap <D-h> <Esc>hi
elseif has('win32')
	imap <F1> <Esc>:w<CR>:!gcc -std=c99 -Wl,--enable-auto-import % -g -o %<.exe && %<.exe<CR>
	map <F1> <Esc>:w<CR>:!gcc -std=c99 -Wl,--enable-auto-import % -g -o %<.exe && %<.exe<CR>
	"
	inoremap <C-h> <Left>
	inoremap <C-j> <Down>
	inoremap <C-k> <Up>
	inoremap <C-l> <Right>
else
	imap <F1> <Esc>:w<CR>:!gcc -std=c99 -lpthread -Wall % -g -o %< && %< <CR>
	map <F1> <Esc>:w<CR>:!gcc -std=c99 -lpthread -Wall % -g -o %< && %< <CR>
endif

imap jk <Esc>

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
map <F5> :call ToggleLine()<CR>
imap <F5> <Esc>:call ToggleLine()<CR>

"新建tab
imap <C-T> <Esc>:tabnew<CR>
nmap <C-T> :tabnew<CR>
"切换tab
imap <C-Left> <Esc>:tabp<CR>
imap <C-Right> <Esc>:tabn<CR>
nmap <C-Left> :tabp<CR>
nmap <C-Right> :tabn<CR>
"关闭tab
"imap <C-W> <Esc>:tabclose<CR>
"nmap <C-W> :tabclose<CR>
