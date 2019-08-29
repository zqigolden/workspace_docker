FROM registry.aibee.cn/platform/hdfs-operate:0.0.2

#update to vim8
RUN rpm -Uvh http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm && rpm --import http://mirror.ghettoforge.org/distributions/gf/RPM-GPG-KEY-gf.el7 && yum -y remove vim-minimal vim-common vim-enhanced && yum -y --enablerepo=gf-plus install vim-enhanced

RUN yum install -y \
ctags \
git \
jq \
libSM \
libXext \
libXrender \
openssh-clients \
openssh-server \
pylint \
tree 


RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
j2cli[yaml] \
opencv-python==4.1.0.25 \
pyyaml \
snakebite 


RUN yum install -y zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

RUN curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

RUN curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

#ssh
RUN echo '123456' | passwd root --stdin && \
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" -q && \
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" -q && \
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" -q

ENV PS1="\[\e[0;32m\]\T\[\e[0;36m\] \w\[\e[0;32m\]$(__git_ps1)\[\e[0m\e[0;32m\]\n > \[\e[0m\]"

#COPY bin/* /usr/local/bin/
COPY ./resource/vim /root/.vim
COPY ./resource/bin/ /usr/bin
COPY ./resource/vimrc /root/.vimrc
COPY ./resource/bashrc /root/.bashrc
#ENTRYPOINT zsh
