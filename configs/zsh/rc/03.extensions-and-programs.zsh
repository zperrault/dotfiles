

# https://hubhub.com/nodenv/nodenv
if hash nodenv; then
  eval "$(nodenv init -)"
fi

if hash rbenv; then
  eval "$(rbenv init -)"
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi

if [[ -d ~/.config/nvim/plugged/fzf/shell ]]; then
  source ~/.config/nvim/plugged/fzf/shell/completion.zsh
  source ~/.config/nvim/plugged/fzf/shell/key-bindings.zsh
fi

export FZF_DEFAULT_COMMAND="rg --files"
