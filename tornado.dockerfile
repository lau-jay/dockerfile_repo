FROM ubuntu:16.04

MAINTAINER pyclear <cappyclear@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse\n\
    deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse\n\
    deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse\n\
    deb http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse\n\
    deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse\n\
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse\n\
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse\n\
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse\n\
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse\n\
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse\n\
    ' > /etc/apt/sources.list

RUN apt-get update && apt-get install python-pip  python-dev sudo -yq
RUN useradd -ms /bin/bash pyclear
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pymongo tornado
RUN apt-get remove python-pip -y && apt-get autoremove -y
RUN echo "pyclear ALL=(ALL) NOPASSWD: ALL"  >> /etc/sudoers
RUN echo "pyclear:pyclear" | chpasswd
USER pyclear
WORKDIR /home/pyclear
RUN cd /home/pyclear

EXPOSE 22 80 5000
