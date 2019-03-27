
if exists('g:loaded_replace') || &compatible
		finish
endif
let g:loaded_replace = 1

if !exists('g:substitution_activator')
    let g:substitution_activator = '<Leader>s'
endif

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

execute "nnoremap <silent> " . g:substitution_activator . " :call <SID>substitute() <CR>"

