# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
CUDA_VERSION=cuda-9.1
#CUDA_VERSION=cuda-9.0
export PATH=/usr/local/${CUDA_VERSION}/bin:$PATH
#export LD_LIBRARY_PATH=/usr/local/${CUDA_VERSION}/lib64:/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/${CUDA_VERSION}/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/ssd/aibeeadmin/aibeeadmin/zhufuguo/usr/local/lib/
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export TMOUT=0
export PYTHONPATH=$PYTHONPATH:/ssd/zq/code-collections/libs:/home/aibeeadmin/caffe2_deploy/caffe2/build/:/home/aibeeadmin/zq/faiss/python
export PATH=$PATH:/opt/package/hadoop-2.6.5/bin
export PS1="\[\e[32;1m\][\[\e[33;1m\]\u\[\e[31;1m\]@\[\e[33;1m\]\h \[\e[36;1m\]\w\[\e[32;1m\]]\[\e[34;1m\]\$ \[\e[0m\]"
alias jqc='jqc() { jq ".images[].file_name" $1 | wc -l;}; jqc'
alias jpgc='jpgc() { find $1 -name '*.jpg' | wc -l;}; jpgc'
alias cn='cn() { realpath $1 | tee /dev/stderr | it2copy;}; cn'
alias scpr="rsync -P --rsh=ssh"
# Attaches tmux to the last session; creates a new session if none exists.
alias t='tmux -CC attach || tmux -CC new-session'

# Attaches tmux to a session (example: ta portal)
alias ta='tmux -CC attach -t'

# Creates a new session
alias tn='tmux -CC new-session'

# Lists all ongoing sessions
alias tl='tmux list-sessions'

alias sl='ls'
alias g='git'

alias gettj='gettj() { scp -r lthpc@192.168.9.6:$1 .;}; gettj'
alias gettj2='gettj2() { scp -r lthpc@192.168.9.7:$1 .;}; gettj2'
alias gettj12='gettj12() { scp -r qzhu@192.168.9.12:$1 .;}; gettj12'

alias hdfsget='hdfsget() { PWD=`pwd`; docker run --rm -it -v /mnt/:/mnt/ -v /ssd/:/ssd/ registry.aibee.cn/aibee/decryption:0.0.9 bash -c "cd $PWD && hdfs dfs -get ${1#/mnt/hdfs1}" ;}; hdfsget'

alias hdfsput='hdfsput() { docker run --rm -v /mnt/:/mnt/ -v /ssd/:/ssd/ registry.aibee.cn/aibee/decryption:0.0.9 bash -c "cd `pwd` && hdfs dfs -put $* ";}; hdfsput'

alias visv='visv() { PWD=`pwd`; PWD=${PWD#/mnt}; for i in $*; do echo ${i} http://vist.aibee.cn:18794/media/.${PWD//\//%2F}%2F${i//\//%2F}; done;}; visv'

alias hdfsls='hdfsls() { hdfs dfs -ls ${1#/mnt/hdfs1} 2>/dev/null | grep -v Found | awk "{ print $NF }";}; hdfsls'

#for hdfs
export JAVA_HOME=/usr/java/default
alias shdfs='sudo JAVA_HOME=/usr/java/default /opt/package/hadoop-2.6.5/bin/hdfs'
alias vi='vim'
alias la='ls -la'

#for workspace docker
PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
source /usr/share/git-core/contrib/completion/git-prompt.sh
