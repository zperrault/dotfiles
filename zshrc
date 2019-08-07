export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# vi mode
bindkey -v

export KEYTIMEOUT=1
export PS1=" %2~ %# "

# https://hubhub.com/nodenv/nodenv
eval "$(nodenv init -)"

# https://hubhub.com/rupa/z
. /usr/local/etc/profile.d/z.sh

alias git="hub"
alias g="git"
alias gst="g status"
alias ga="g add"
alias gc="g commit"
alias gca="g commit --all"
alias gb="g branch"
alias gco="g checkout"
alias gcb="g checkout -b"
alias gd="g diff"
alias gp="g push"

alias cat=ccat

export GPG_TTY=$(tty)

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTIONS="--preview 'bat --style=numbers --color=always {}'"

source ~/.dotfiles/secrets/zshrc

alias pgcli_remote="pgcli -U $__SECRET__RDS_USER -d $__SECRET__RDS_DATABASE"
alias pgcli_development="echo $__SECRET__DEVELOPMENT_RDS_PASSWORD | pbcopy && pgcli_remote -h $__SECRET__DEVELOPMENT_RDS_HOST"
alias pgcli_local="pgcli -d bigspring_local"
alias psql_local="psql -d bigspring_local"
alias psql_development="psql -U $__SECRET__RDS_USER -d $__SECRET__RDS_DATABASE -h $__SECRET__DEVELOPMENT_RDS_HOST"

alias sqitch_remote="sqitch --db-port 5432 --db-user $__SECRET__RDS_USER --db-name $__SECRET__RDS_DATABASE"
alias sqitch_development="SQITCH_PASSWORD=$__SECRET__DEVELOPMENT_RDS_PASSWORD sqitch_remote --db-host $__SECRET__DEVELOPMENT_RDS_HOST"
alias sqitch_staging="SQITCH_PASSWORD=$__SECRET__STAGING_RDS_PASSWORD sqitch_remote --db-host $__SECRET__STAGING_RDS_HOST"
alias sqitch_production="SQITCH_PASSWORD=$__SECRET__PRODUCTION_RDS_PASSWORD sqitch_remote --db-host $__SECRET__PRODUCTION_RDS_HOST"
alias sqitch_local="sqitch --db-name bigspring_local"

export DOTFILES_SCRIPTS=$HOME/.dotfiles/scripts
export PATH=$PATH:$DOTFILES_SCRIPTS

alias be="bundle exec"

export local_PGDATABASE="bigspring_local"
export local_PGHOST="localhost"
export local_PGPORT="5432"
export local_PGUSER=
export local_PGPASSWORD=
export local_JWT_SECRET="$__SECRET__LOCAL_JWT_SECRET"
fpath+=${ZDOTDIR:-~}/.zsh_functions
export EDITOR=nvim

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
base16_tomorrow

function issue() {
  jira $@ $(jira current)
}
