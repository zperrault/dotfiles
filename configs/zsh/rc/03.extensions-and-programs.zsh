

# https://hubhub.com/nodenv/nodenv
if hash nodenv; then
  eval "$(nodenv init -)"
fi

if hash rbenv; then
  eval "$(rbenv init -)"
fi

if [[ -d ~/.config/nvim/plugged/fzf/shell ]]; then
  source ~/.config/nvim/plugged/fzf/shell/completion.zsh
  source ~/.config/nvim/plugged/fzf/shell/key-bindings.zsh
fi
