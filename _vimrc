" Initial Setup------------------------------------{{{
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set number
let mapleader = ","
colorscheme darkblue

" }}}

" Vimscript File Settings--------------------------{{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Buffer Tab Settings and Navigation--------------------------------{{{
let g:airline#extensions#tabline#enabled = 1
set hidden

" Open new buffer
nnoremap <leader>T :enew<CR>
" Move to the next buffer
nnoremap <leader>n :bnext<CR>
" Move to the previous buffer
nnoremap <leader>N :bprevious<CR>
" Close current buffer and move to previous
function! CloseBuffer() 
	let l:bufCount=len(filter(range(1,bufnr('$')), 'buflisted(v:val)'))
	if l:bufCount <2
		enew 
		bd #
	else
		bp 
		bd #
	endif
endfunction
nnoremap <leader>bq :call CloseBuffer()<CR>
" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>
" }}}

" Plugins-----------------------------------------------------------{{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'sukima/xmledit'
Plugin 'brandonbloom/csearch.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'sk1418/QFGrep'

" Git plugins
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Javascript plugins
Plugin 'pangloss/vim-javascript'
Plugin 'skammer/vim-css-color'
Plugin 'jiangmiao/auto-pairs'
	" for Emmet-Vim"
Plugin 'mattn/webapi-vim'
Plugin 'mattn/emmet-vim'
Plugin 'michalliu/jsruntime.vim'
Plugin 'michalliu/jsoncodecs.vim'
Plugin 'michalliu/sourcebeautify.vim'

" Golang plugins
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
call vundle#config#require(g:bundles)
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" Ctrlp Settings----------------------------------------------------{{{

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 0
" }}}

" NERDTree Settings--------------------------------------------------------{{{

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" Emmet Settings-------------------------------------------------------------{{{

let g:user_emmet_leader_key='<C-Z>'
" !! BROKEN !!
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/_snippets_custom.json')), "\n"))
" }}}

" XML Settings--------------------------------------------------------{{{

syntax on
filetype on
au bufnewfile,bufread *.xaml set filetype=xml
" xml folding
let g:xml_syntax_folding=1
au filetype xml setlocal foldmethod=syntax
" }}}

" Javascript Folding-------------------------------------------------------{{{
function! JavaScriptFold()
	setl foldmethod=syntax
	setl foldlevelstart=1
	syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

	function! FoldText()
		return substitute(getline(v:foldstart), '{.*}', '{...}', '')
	endfunction
	setl foldtext=FoldText()
endfunction
augroup javascript_folding
	autocmd!
	autocmd FileType javascript call JavaScriptFold()
	autocmd FileType javascript setl fen
augroup END
" }}}

" Custom Mappings--------------------------------------------------{{{

nnoremap - :<c-u>execute "normal! dd" . v:count1 . "j0P"<cr>
nnoremap _ :<c-u>execute "normal! dd" . v:count1 . "k0P"<cr>
nnoremap <leader>v :NERDTreeFind<cr>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
nnoremap <leader>ss :csearch<space>
nnoremap <Leader>sf :CSearch<SPACE>-f<SPACE>.+\.
inoremap jk <esc>
inoremap <esc> jk
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>rv :so $MYVIMRC<CR>
" }}}

" Include Other Vim Scripts-----------------------------------------------{{{
source $HOME/vimfiles/rc/go_mappings.vim
" }}}
