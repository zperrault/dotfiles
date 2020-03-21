

# https://hubhub.com/nodenv/nodenv
if hash nodenv; then
  eval "$(nodenv init -)"
fi

if hash rbenv; then
  eval "$(rbenv init -)"
fi

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_onedark
