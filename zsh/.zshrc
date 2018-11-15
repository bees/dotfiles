setopt hist_ignore_all_dups
setopt hist_ignore_space
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE


source ~/.zplug/init.zsh


# utilities
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git", from:oh-my-zsh
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*linux*amd64*"

zplug "peco/peco", \
    from:gh-r, \
    as:command, \
    use:"peco"

# fluff
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load # --verbose

export PATH="$HOME/.local/bin/:$HOME/.yarn/bin:$HOME/go/bin/:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export VISUAL=nvim
export PAGER='less -S'

alias vim='nvim'
alias get_cred='aws ecr get-login --no-include-email --region us-east-1'
alias cdg='cdgitroot'
alias ls='exa'

hash -d ens="/home/ad/work/enrollments-svc"
hash -d sas="/home/ad/work/sales-aggr-svc"

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
  node
  venv
  aws
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

# functions

# cd-gitroot (cant get zplug to work)

function cdgitroot() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
    cdgitroot_print_error "Not in a git repository"
    return 1
  fi

  local relative_path="$1"
  local root_path=$(git rev-parse --show-toplevel)

  if [ -n "$relative_path" ]; then
    cd "$root_path/$relative_path"
  else
    cd "$root_path"
  fi
}
