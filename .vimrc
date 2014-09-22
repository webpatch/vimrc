filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不要备份文件（根据自己需要取舍）
set nobackup
set nowb
" 不要生成swap文件，当buffer被丢弃的时候隐藏它
set noswapfile
set whichwrap+=<,>,h,l
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"编码设置,彻底解决中文乱码问题
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
let &termencoding=&encoding
" 解决consle输出乱码
language messages zh_CN.utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 界面
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语法高亮
syntax enable
syntax on
" 显示行号
"set nu!
set rnu
set lbr
" 配色方案
color desert 
" 总是显示状态栏
set laststatus=2
"
set shortmess=atI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
