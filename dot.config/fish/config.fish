# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tkyshm/google-cloud-sdk/path.fish.inc' ]; . '/home/tkyshm/google-cloud-sdk/path.fish.inc'; end

set GOPATH /home/tkyshm/go
set PATH /usr/local/bin /usr/sbin /usr/local/node/bin $GOPATH/bin $HOME/bin $PATH

alias B='git branch | fzf --reverse --ansi --prompt "git branch> " | head -n 1 | sed -e "s/^\*\s*//g"'
alias T='git branch -r | fzf --reverse --ansi --prompt "git remote branch> " | head -n 1 | sed -e "s/^\*\s*//g"'
alias S='git status -s | fzf -m --reverse --ansi --prompt "git status> " | sed -e "s/^\s*\S*\s*//g"'
