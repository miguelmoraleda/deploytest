FROM ubuntu:14.04

RUN apt-get install -y git
RUN apt-get install -y python
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y bash-completion

RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -

RUN apt-get install -y nodejs

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

RUN apt-get install git-lfs

RUN git lfs install

RUN mkdir -p "$HOME/.ssh"

RUN mkdir /app
WORKDIR /app

ADD . /app


RUN cp sshkey.env $HOME/.ssh/id_rsa

RUN chmod 600 $HOME/.ssh/id_rsa

RUN chmod -R 700 $HOME/.ssh

RUN eval "$(ssh-agent -s)"



RUN echo "Host github.com\n\tStrictHostKeyChecking no\n\tPermitLocalCommand yes\n\tUserKnownHostsFile=/dev/null" >> ~/.ssh/config

RUN cat $HOME/.ssh/config

RUN ls -la /app
