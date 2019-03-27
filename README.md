# vim-substitution

This plugin simplifies the find-replace system in vim. 


## Usage

\<Leader\>s activates the plugin. Will then prompt user for word to find and word to replace. 

## Installation

Add

```vim
Plug 'kaisucode/vim-substitution'
```

to your `.vimrc`.

## Customization

### Mappings
The default mapping is \<Leader\>s, but you can change it in your vim config
```vim
let g:substitution_activator = '<Leader>a'
```

### Search options
Set these to 1 in your vim config to activate
```vim
let g:substitution_fullwordmatch = 1
let g:substitution_global = 1
let g:substitution_confirmation = 1
```




## Need to work on
* Customization (vim regrex options)

