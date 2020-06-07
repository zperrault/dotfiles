export PATH=$HOME/.bin:$PATH

# https://github.com/theory/pgenv
export PATH=$HOME/.pgenv/bin:$HOME/.pgenv/pgsql/bin:$PATH

export PATH=$(echo $PATH | tr : '\n' | awk '!a[$0]++' | paste -sd ':' -)
