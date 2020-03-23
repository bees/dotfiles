SAVEHIST=1000000
HISTFILE=~/.zsh_history
unsetopt BEEP


source ~/.zplug/init.zsh

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug mafredri/zsh-async, from:github
zplug mollifier/cd-gitroot
zplug zsh-users/zsh-completions
zplug peco/peco, from:gh-r, as:command, use:"*linux*amd64*"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load


export TERM=xterm-256color

bindkey -v



#export PATH="/home/ad/.cabal/bin:/home/ad/.local/bin:/home/ad/.yarn/bin:/home/ad/.pyenv/bin:/home/ad/.dotnet:$PATH"
export PATH="/home/ad/.asdf/installs/nodejs/12.13.0/.npm/bin:/home/ad/.asdf/installs/rust/stable/bin:/home/ad/.poetry/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export VISUAL=nvim
export PAGER='less -S'

alias gcm='git checkout master'
alias vim='nvim'
alias get_cred='aws ecr get-login --no-include-email --region us-east-1'
alias cdg='cd-gitroot'
alias ls='exa'
alias scale2="gsettings set org.gnome.settings-daemon.plugins.xsettings overrides \"[{'Gdk/WindowScalingFactor', <2>}]\""
alias scale1="gsettings set org.gnome.settings-daemon.plugins.xsettings overrides \"[{'Gdk/WindowScalingFactor', <1>}]\""
export BAT_THEME="GitHub"
alias bat="bat --theme=${BAT_THEME}"

# addon configs


# fzf
export FZF_DIR="/usr/share/fzf"
[ -f $FZF_DIR/completion.zsh ]   && source $FZF_DIR/completion.zsh
[ -f $FZF_DIR/key-bindings.zsh ] && source $FZF_DIR/key-bindings.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --theme=${BAT_THEME} --color=always --style=header,grid --line-range :300 {}'"


# spaceship
export SPACESHIP_CHAR_SYMBOL="» "
export SPACESHIP_VI_MODE_SHOW=false

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  venv
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
  )

# bat
export BAT_PAGER="less -RF"

# asdf

. /opt/asdf-vm/asdf.sh

. /opt/asdf-vm/completions/asdf.bash

# k8s
## kubectl autocompletion
source <(kubectl completion zsh)

# config management
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config:$HOME/.minikube-config/config
