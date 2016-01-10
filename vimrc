set nocompatible
filetype off "required
set nu
set ai "自动缩进
set si "智能缩进
set scrolloff=5 "缓冲5行
set backspace=2 "解决删除失效

set encoding=utf-8
set wildmenu "设置提示列表

syntax enable "打开语法高亮
syntax on     "打开文件类型检测

filetype indent on  "针对不同文件类型采用不同的缩进格式
filetype plugin on  "针对不同文件类型加载对应的插件

set ruler "右下角显示光标位置
set hlsearch "高亮搜索结果
set incsearch "开启实时搜索
set showmatch "显示括号匹配
set matchpairs=(:),{:},[:],<:>
set mouse=a "启用鼠标

set shiftwidth=4 "设置缩进长度
set tabstop=4    "设置制表符长度


"===============快捷键区块=============

"映射窗口切换快捷键
nnoremap <S-Up> <C-W><Up>
nnoremap <S-Down> <C-W><Down>
nnoremap <S-Left> <C-W><Left>
nnoremap <S-Right> <C-W><Right>

nnoremap <C-S-Left> <C-W><
nnoremap <C-S-Right> <C-W>>
let mapleader="\\"
set pastetoggle=<leader>z

"hack mac复制粘贴
vnoremap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p


"=====================================


"------------ plugin 区块-------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()  "required
filetype plugin indent on "require

Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'nerdtree-ack'
Plugin 'einars/js-beautify'
"Plugin 'vim-jsbeautify'
Plugin 'maksimr/vim-jsbeautify'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'groenewege/vim-less'
Plugin 'AtsushiM/search-parent.vim'
Plugin 'AtsushiM/sass-compile.vim'

"插件功能区块 

" ------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------
"NERDTree: autoload when startup vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"NERDTree: C-n to open NERDTree
map <C-n> :NERDTreeFocus<CR>

" NERDTree: File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let g:NERDTreeMouseMode = 1
let g:NERDTreeMapToggleZoom = '<Space>'

" Emmet
map <C-e> <C-y>,
imap <C-e> <C-y>,
let g:user_emmet_mode='in'

" vim-surround
Plugin 'tpope/vim-surround'
xmap s <Plug>VSurround

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"sass-compile

let $PATH=$PATH."/usr/local/bin/compass"
let g:sass_compile_cdloop = 5
let g:sass_compile_auto = 1
let g:sass_compile_file = ['scss', 'sass']
"let g:sass_compile_cssdir = ['css', 'stylesheet']
let g:sass_compile_beforecmd = "growlnotify -t 'sass-compile.vim' -m 'start sass compile.'"
let g:sass_compile_aftercmd = "growlnotify -t 'sass-compile.vim' -m ${sasscompileresult}"
nmap <C-b> :SassCompile<cr>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'haml'] }
" 关闭sass语法检查

" vim-jsbeautify
"map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json 
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx 
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

"----------------- 设置主题-----------------
if has("gui")
	colorscheme solarized
	set background=dark
else
	colorscheme molokai
endif

