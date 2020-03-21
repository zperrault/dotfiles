# git
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

function makegif() {
  ffmpeg -i $1 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > ${1%.*}.gif
}
