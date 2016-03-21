FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y mercurial
RUN apt-get install -y git
RUN apt-get install -y python
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y strace
RUN apt-get install -y diffstat
RUN apt-get install -y pkg-config
RUN apt-get install -y cmake
RUN apt-get install -y build-essential
RUN apt-get install -y tcpdump
RUN apt-get install -y screen
RUN apt-get install -y bash-completion

RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -

RUN sudo apt-get install -y nodejs

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

RUN sudo apt-get install git-lfs

RUN git lfs install
