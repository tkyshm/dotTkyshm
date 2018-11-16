" Return top level directory path of Git project.
function IsGitRepo()
    let gitdir = system("echo -n $(git rev-parse --show-toplevel)/.git")
    return isdirectory(gitdir)
endfunction

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" Re-indent the whole buffer.
function! Indent()
  call Preserve('normal gg=G')
endfunction

function! ErlFmt()
  let out = system('ei ' . expand('%:p'))
  call writefile(split(out, "\n"), expand('%:p'))
  exec ":e!"
endfunction

" for fzf file-search
function! FzfFileSearch()
  if IsGitRepo()
      call fzf#run({
          \ 'source': 'git ls-files --exclude-standard -oc',
          \ 'sink': 'e',
          \ 'options': '--multi --reverse'})
  else
      call fzf#run({
          \ 'sink': 'e',
          \ 'options': '--multi --reverse'})
  endif
endfunction
