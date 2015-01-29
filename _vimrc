source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

let mapleader = ","

let g:ctrlp_working_path_mode = 'ra'
let g:airline#extensions#tabline#enabled = 1
set hidden

" Open new buffer
nnoremap <leader>T :enew<CR>
" Move to the next buffer
nnoremap <leader>n :bnext<CR>
" Move to the previous buffer
nnoremap <leader>N :bprevious<CR>
" Close current buffer and move to previous
nnoremap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>

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

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:user_emmet_leader_key='<C-Z>'
" !! BROKEN !!
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/_snippets_custom.json')), "\n"))

syntax on
filetype on

"au BufNewFile,BufRead *.xaml set filetype=xml
" REPLACED BY THIS
function! FiletypeEditorconfig(config)
	if has_key(a:config, 'vim_filetype')
		let &filetype = a:config['vim_filetype']
	endif

	return 0    " Return 0 to show no error happened
endfunction

call editorconfig#AddNewHook(function('FiletypeEditorconfig'))

" XML FOLDING
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

nnoremap - ddj0P
nnoremap _ ddk0P
nnoremap <Leader>v :NERDTreeFind<CR>
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
nnoremap <Leader>ss :CSearch<SPACE>
nnoremap <Leader>sf :CSearch<SPACE>-f<SPACE>.+\.

colorscheme darkblue

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>rv :so $MYVIMRC<CR>
source $HOME/vimfiles/rc/go_mappings.vim

