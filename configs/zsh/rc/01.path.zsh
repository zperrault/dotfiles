export PATH=$HOME/.bin:$PATH

export PATH=$(echo $PATH | tr : '\n' | awk '!a[$0]++' | paste -sd ':' -)
