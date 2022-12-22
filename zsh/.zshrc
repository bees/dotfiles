if type brew &>/dev/null
then
  FPATH=":$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  . /opt/homebrew/opt/asdf/libexec/asdf.sh
  autoload -Uz compinit
  compinit
fi

PATH="$PATH:$HOME/.local/bin/"
fpath=($HOME/.zsh/cd-gitroot(N-/) $fpath)

autoload -Uz cd-gitroot

alias cdg="cd-gitroot"
alias vim="nvim"
alias ls="exa"
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"

export PATH="$HOME/.poetry/bin:$PATH"
eval "$(fnm env --use-on-cd)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# pnpm
export PNPM_HOME="/Users/ariandaneshvar/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end