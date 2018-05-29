# Path to your oh-my-zsh installation.
export ZSH=/home/ad/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="flazz"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker ansible)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export TERM=xterm-256color

# Key bindings
# ------------
if [[ $- == *i* ]]; then
  # CTRL-T - Paste the selected file path(s) into the command line
  __fsel() {
    local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
      -o -type f -print \
      -o -type d -print \
      -o -type l -print 2> /dev/null | sed 1d | cut -b3-"}"
    setopt localoptions pipefail
    eval "$cmd | $(__fzfcmd) -m $FZF_CTRL_T_OPTS" | while read item; do
      echo -n "${(q)item} "
    done
    local ret=$?
    echo
    return $ret
  }

  __fzfcmd() {
    [ ${FZF_TMUX:-1} -eq 1 ] && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
  }

  fzf-file-widget() {
    LBUFFER="${LBUFFER}$(__fsel)"
    local ret=$?
    zle redisplay
    return $ret
  }
  zle     -N   fzf-file-widget
  bindkey '^T' fzf-file-widget

  # ALT-C - cd into the selected directory
  fzf-cd-widget() {
    local cmd="${FZF_ALT_C_COMMAND:-"command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
      -o -type d -print 2> /dev/null | sed 1d | cut -b3-"}"
    setopt localoptions pipefail
    cd "${$(eval "$cmd | $(__fzfcmd) +m $FZF_ALT_C_OPTS"):-.}"
    local ret=$?
    zle reset-prompt
    return $ret
  }
  zle     -N    fzf-cd-widget
  bindkey '\ec' fzf-cd-widget

  # CTRL-R - Paste the selected command from history into the command line
  fzf-history-widget() {
    local selected num
    setopt localoptions noglobsubst pipefail
    selected=( $(fc -l 1 | eval "$(__fzfcmd) +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r $FZF_CTRL_R_OPTS -q ${(q)LBUFFER}") )
    local ret=$?
    if [ -n "$selected" ]; then
      num=$selected[1]
      if [ -n "$num" ]; then
        zle vi-fetch-history -n $num
      fi
    fi
    zle redisplay
    return $ret
  }
  zle     -N   fzf-history-widget
  bindkey '^R' fzf-history-widget

fi

bindkey -v

[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
eval `dircolors ~/.vimspectr-shell/dircolors`

fpath=(/home/ad/bin/cd-gitroot(N-/) $fpath)
autoload -Uz cd-gitroot



export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=/home/ad/.yarn/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export VISUAL=nvim
export PAGER='less -S'

alias gcm='git checkout master'
alias vim='nvim'
alias get_cred='aws ecr get-login --no-include-email --region us-east-1'
alias cdg='cd-gitroot'
hash -d ap="/home/ad/Projects/alpine"
hash -d gbf="/home/ad/Projects/gb-fin"
hash -d gbs="/home/ad/Projects/gb-streams"


