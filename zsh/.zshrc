SAVEHIST=10000
HISTFILE=~/.zsh_history
unsetopt BEEP

N_PREFIX=$HOME/.n

source ~/.zplug/init.zsh

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load


export TERM=xterm-256color

bindkey -v



export PATH="/home/ad/.local/bin:/home/ad/.yarn/bin:/home/ad/.pyenv/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export VISUAL=nvim
export PAGER='less -S'

alias gcm='git checkout master'
alias vim='nvim'
alias get_cred='aws ecr get-login --no-include-email --region us-east-1'
alias cdg='cd-gitroot'
alias ls='exa'
hash -d ap="/home/ad/Projects/alpine"
hash -d gbf="/home/ad/Projects/gb-fin"
hash -d gbs="/home/ad/Projects/gb-streams"




[ -f $HOME/.fzf/completion.zsh ]   && source $HOME/.fzf/completion.zsh
[ -f $HOME/.fzf/key-bindings.zsh ] && source $HOME/.fzf/key-bindings.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export SPACESHIP_CHAR_SYMBOL="» "
export SPACESHIP_VI_MODE_SHOW=false
