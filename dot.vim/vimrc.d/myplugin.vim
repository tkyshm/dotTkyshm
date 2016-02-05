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

