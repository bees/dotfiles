source ~/.zplug/init.zsh
setopt NO_BEEP

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# utilities
zplug "zsh-users/zsh-history-substring-search"
zplug "mollifier/cd-gitroot", as:command
zplug "plugins/git", from:oh-my-zsh
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*linux*amd64*"

# fluff
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load # --verbose

export PATH="$HOME/.local/bin/:$HOME/.yarn/bin_packages/bin/:$HOME/go/bin/:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export VISUAL=nvim
export PAGER='less -S'

alias vim='nvim'
alias get_cred='aws ecr get-login --no-include-email --region us-east-1'
alias cdg='cd-gitroot'
alias ls='exa'

export TERM=xterm-256color

bindkey -v


# plugin configs

# spaceship
SPACESHIP_PROMPT_ORDER=(
  time
  user
  dir
  host
  git
  line_sep
  jobs
  char
)

SPACESHIP_CHAR_SYMBOL="»"
SPACESHIP_CHAR_SUFFIX=" "

# fzf

[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# opam configuration
test -r /home/ad/.opam/opam-init/init.zsh && . /home/ad/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
