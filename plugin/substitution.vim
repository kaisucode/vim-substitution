
if exists('g:loaded_replace') || &compatible
		finish
endif
let g:loaded_replace = 1

if !exists('g:substitution_fullwordmatch')
	let g:substitution_fullwordmatch = 0
endif
if !exists('g:substitution_global')
	let g:substitution_global = 0
endif
if !exists('g:substitution_confirmation')
	let g:substitution_confirmation = 0
endif
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

	let l:regrexBase = "%s!"
	let l:regrexMid = "!"
	let l:regrexEnd = "!"

	if g:substitution_global 
		let l:regrexEnd .= 'g'
	endif
	if g:substitution_confirmation 
		let l:regrexEnd .= 'c'
	endif
	if g:substitution_fullwordmatch
		let l:regrexBase .= "\\<"
		let l:regrexMid = "\\>" . l:regrexMid
	endif

	exec l:regrexBase . l:oldword . l:regrexMid . l:newword . l:regrexEnd
endfunction

execute "nnoremap <silent> " . g:substitution_activator . " :call <SID>substitute() <CR>"

