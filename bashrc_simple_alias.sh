
#-------------CUSTOM_SIMPLE_ALIAS_START--------------------
#From https://code.aibee.cn/qzhu/workspace-docker/raw/master/bashrc_simple_alias.sh
## iTerm2+Tmux alias
export USE_CUSTOM_SIMPLE_ALIAS 1
alias t='tmux -CC attach || tmux -CC new-session'
alias ta='tmux -CC attach -t'
alias tn='tmux -CC new-session'
alias tl='tmux list-sessions'

alias ..='cd .. && ls'
alias du0='du -hd0'
alias du1='du -hd1'
alias l='ls -lah --color=auto'
alias python='python3'
alias scpr="rsync -P --rsh=ssh"
alias sl='ls'
alias vi='vim'
c(){ cd "$1"; ls -lh --color=auto; }
cn() { realpath $1 | tee /dev/stderr | it2copy; }
hls() { hdfs dfs -ls $1 2>/dev/null | grep -v Found | awk "{ print $NF }"; }
#-------------CUSTOM_SIMPLE_ALIAS_END--------------------
