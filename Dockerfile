FROM registry.aibee.cn/platform/hdfs-operate:0.0.2

#update to vim8
RUN rpm -Uvh http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm && rpm --import http://mirror.ghettoforge.org/distributions/gf/RPM-GPG-KEY-gf.el7 && yum -y remove vim-minimal vim-common vim-enhanced && yum -y --enablerepo=gf-plus install vim-enhanced

RUN yum install -y \
libSM \
libXrender \
libXext \
openssh-clients \
jq \
git \
pylint \
ctags

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
opencv-python==4.1.0.25 \
pyyaml \
snakebite

RUN yum install -y zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

RUN curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

ENV PS1="\[\e[0;32m\]\T\[\e[0;36m\] \w\[\e[0;32m\]$(__git_ps1)\[\e[0m\e[0;32m\]\n > \[\e[0m\]"

#COPY bin/* /usr/local/bin/
COPY ./resource/vim /root/.vim
COPY ./resource/bin/ /usr/bin
COPY ./resource/vimrc /root/.vimrc
COPY ./resource/bashrc /root/.bashrc
#ENTRYPOINT zsh
