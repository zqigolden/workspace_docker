FROM registry.aibee.cn/qzhu/python:3.8

RUN wget http://mirrors.aibee.cn/tools/apache_hadoop/krb5.conf -O /etc/krb5.conf \
 && sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list \
 && apt update \
 && apt install -y ctags git jq vim ffmpeg expect pylint tree libkrb5-dev krb5-user 

#pip
RUN python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
 j2cli[yaml] \
 opencv-python \
 pyyaml

#aibee_hdfs
RUN pip3 install aibee_hdfs modelmanage2 -I -i http://repo.aibee.cn/repository/pypi/simple --trusted-host repo.aibee.cn

#Iterm2 integration
RUN curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

ENV PATH=/root/bin/:${PATH}

COPY ./resource/vim /root/.vim
COPY ./resource/bin/ /root/bin
COPY ./resource/vimrc /root/.vimrc
COPY ./resource/bashrc /root/.bashrc

CMD bash
