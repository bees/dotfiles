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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
