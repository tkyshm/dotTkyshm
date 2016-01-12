""--------------------------------------------
" lightline setting
""--------------------------------------------
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

"let g:lightline = {
"      \ 'colorscheme': 'solarized',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'fugitive', 'filename' ] ]
"      \ },
"      \ 'component_function': {
"      \   'fugitive': 'MyFugitive',
"      \   'readonly': 'MyReadonly',
"      \   'modified': 'MyModified',
"      \   'filename': 'MyFilename'
"      \ },
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' }
"      \ }
"
"function! MyModified()
"  if &filetype == "help"
"    return ""
"  elseif &modified
"    return "+"
"  elseif &modifiable
"    return ""
"  else
"    return ""
"  endif
"endfunction
"
"function! MyReadonly()
"  if &filetype == "help"
"    return ""
"  elseif &readonly
"    return "❖"
"  else
"    return ""
"  endif
"endfunction
"
"function! MyFugitive()
"  if exists("*fugitive#head")
"    let _ = fugitive#head()
"    return strlen(_) ? '➲ '._ : ''
"  endif
"  return ''
"endfunction
"
"function! MyFilename()
"  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
"       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
"       \ ('' != MyModified() ? ' ' . MyModified() : '')
"endfunction


