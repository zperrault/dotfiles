export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"



HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# vi mode
bindkey -v

export KEYTIMEOUT=1
export PS1=" %2~ %# "

# https://hubhub.com/nodenv/nodenv
eval "$(nodenv init -)"

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# https://hubhub.com/rupa/z
. /usr/local/etc/profile.d/z.sh

alias git="hub"
alias g="git"
alias gst="g status"
alias ga="g add"
alias gc="g commit"
alias gca="g commit --all"
alias gb="switch-branch"
alias gbb="g branch"
alias gco="g checkout"
alias gcb="g checkout -b"
alias gd="g diff"
alias gp="g push --force-with-lease"
alias gf="g fetch --prune"
alias gpl="g pull --prune"
alias gr="g rebase"

alias cat=ccat

alias rc="nvim ~/.zshrc -c 'normal G' && source ~/.zshrc"

alias sed="gsed"

export GPG_TTY=$(tty)

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.dotfiles/secrets/zshrc

alias pgcli_remote="pgcli -U $__SECRET__RDS_USER -d $__SECRET__RDS_DATABASE"
alias pgcli_development="pgcli_remote -h $__SECRET__DEVELOPMENT_RDS_HOST"
alias pgcli_production="pgcli_remote -h $__SECRET__PRODUCTION_RDS_HOST"
alias pgcli_production_rr="pgcli_remote -h $__SECRET__PRODUCTION_RDS_HOST_RR"
alias pgcli_local="pgcli -d bigspring_local"
alias psql_local="psql -d bigspring_local"
alias psql_development="psql -U $__SECRET__RDS_USER -d $__SECRET__RDS_DATABASE -h $__SECRET__DEVELOPMENT_RDS_HOST"

alias sqitch_remote="sqitch --db-port 5432 --db-user $__SECRET__RDS_USER --db-name $__SECRET__RDS_DATABASE"
alias sqitch_development="sqitch_remote --db-host $__SECRET__DEVELOPMENT_RDS_HOST"
alias sqitch_staging="sqitch_remote --db-host $__SECRET__STAGING_RDS_HOST"
alias sqitch_production="sqitch_remote --db-host $__SECRET__PRODUCTION_RDS_HOST"
alias sqitch_local="sqitch --db-name bigspring_local"

export DOTFILES_SCRIPTS=$HOME/.dotfiles/scripts
export PATH=$PATH:$DOTFILES_SCRIPTS


export PATH=$(echo $PATH | tr : '\n' | awk '!a[$0]++' | paste -sd ':' -)

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

base16_onedark

function issue() {
  jira $@ $(jira current)
}


alias js='bundle exec jekyll serve --drafts'
alias jb='bundle exec jekyll build'

alias profile_local_auth="gq http://local-api.bigspring.io/graphql -q 'mutation { authenticate(input: { profileExternalId: \"learner-1\", companyExternalId: \"test-co-1\"}) { jwtToken } }' | jq -r .data.authenticate.jwtToken"
function gq_local_profile() {
  JWT=$(profile_local_auth)
  gq http://local-api.bigspring.io/graphql -H "Authorization: Bearer $JWT" $@
}

function get_admin_development_password() {
  eval $(op signin bigspringskills)
  op get item k4d6lvzuhbd6bgnb346lv7isk4 | jq '.details.fields[] | select(.type == "P") | .value'
}
function admin_development_auth() {
  gq https://pwa-development.bigspring.io/graphql -q "mutation { authenticateAdmin(input: { username: \"Admin\", password: $(get_admin_development_password) }) { jwtToken } }" | jq -r '.data.authenticateAdmin.jwtToken'
}
alias admin_local_auth="gq http://localhost:5000/graphql -q 'mutation { authenticateAdmin(input: { username: \"Admin\", password: \"12345\" }) { jwtToken } }' | jq -r .data.authenticateAdmin.jwtToken"
function gq_local_admin() {
  JWT=$(admin_local_auth)
  gq http://localhost:5000/graphql -H "Authorization: Bearer $JWT" $@
}
function gq_development_admin() {
  JWT=$(admin_development_auth)
  gq https://pwa-development.bigspring.io/graphql -H "Authorization: Bearer $JWT" $@
}

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

function makegif() {
  ffmpeg -i $1 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > ${1%.*}.gif
}
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
function clean-up-git() {
  git remote prune origin
  git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/zach/github/postlight/mta-live-media-manager/lambda-functions/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/zach/github/postlight/mta-live-media-manager/lambda-functions/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/zach/github/postlight/mta-live-media-manager/lambda-functions/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/zach/github/postlight/mta-live-media-manager/lambda-functions/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/zach/github/postlight/mta-live-media-manager/lambda-functions/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/zach/github/postlight/mta-live-media-manager/lambda-functions/node_modules/tabtab/.completions/slss.zsh
