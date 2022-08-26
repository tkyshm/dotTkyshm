# Created by newuser for 5.8.1

export TERM=xterm-256color

HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

autoload -Uz compinit

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors "${LS_COLORS}"

source ~/.zplug/init.zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "junegunn/fzf", use:shell/completion.zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# Theme
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

source ~/.myzsh/zshenv

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tkyshm/google-cloud-sdk/path.zsh.inc' ]; then . '/home/tkyshm/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tkyshm/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/tkyshm/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tkyshm/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tkyshm/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tkyshm/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tkyshm/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
