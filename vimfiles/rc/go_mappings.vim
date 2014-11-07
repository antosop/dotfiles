
au FileType go nmap <Leader>dc <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go :map <Leader>em :call ExtractMethod()<CR>


au FileType go :map [[ 0?{<CR>w99[{
au FileType go :map ]] j0[[%/{<CR>$
au FileType go :map ][ /}<CR>b99]}
au FileType go :map [] k$][%?}<CR>

function! ExtractMethod() range
	let name = inputdialog("Name of new method:")
	'<
	exe "normal! v"
	'>
	exe "normal! d][j"
	exe "normal! Ofunc " . name ."(){\<CR>\<Esc>gPoreturn \<CR>}\<Esc>k"
	s/return/\/\/ return/ge
	normal! j%
	normal! kf(
	exe "normal! yyPi// = \<Esc>wdwA;\<Esc>"
	normal! ==
	normal! j0w
endfunction
