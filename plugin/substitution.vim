
if exists('g:loaded_replace') || &compatible
		finish
endif
let g:loaded_replace = 1

function! s:substitute()
	call inputsave()
	let l:oldword = input('Word to replace: ')
	call inputrestore()

	call inputsave()
	let l:newword = input('Replace with: ')
	call inputrestore()


	" Vanilla
	" exec "%s/" . l:oldword . "/" . l:newword . "/"

	" Global, full-word-fit only
	exec "%s/\\<" . l:oldword . "\\>/" . l:newword . "/g"

	" Global, full-word-fit only, ask for confirmation
	" exec "%s/\\<" . l:oldword . "\\>/" . l:newword . "/gc"
endfunction


nnoremap <silent> <Leader>s :call <SID>substitute()<CR>

