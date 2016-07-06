" Return top level directory path of Git project.
function GitTopDir()
    return system("git rev-parse --show-toplevel")
endfunction

function UniteFileSearch()
    if isdirectory(GitTopDir() . "/.git")
        command Unite -start-insert file_rec/git:--cached:--others:--exclude-standard
    else
        command Unite -start-insert file/async:!
    endif
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
