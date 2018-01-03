FROM ubuntu:16.04

MAINTAINER Takashi Tsubone "tsubone.takashi@jp.panasonic.com"

RUN apt-get update -y && \
    apt-get install -y git sudo net-tools psmisc

RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential libssl-dev libreadline-dev zlib1g-dev

RUN apt-get update -y && \
    apt-get install -y openssh-server ufw curl

RUN apt-get update -y && \
    apt-get install -y bash

RUN apt-get update -y && \
    apt-get install -y git-core git-daemon-run

ARG USER="tsubone"
ARG GROUP="tsubone"
ARG UID="1000"
ARG GID="1000"
ARG PASSWD="tsubone0"

RUN groupadd -g $GID $GROUP && useradd -u $UID -g $GID -G sudo -m $USER
RUN echo "$USER:$PASSWD" | chpasswd

RUN mkdir /var/run/sshd

RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22

ADD service.sh /root/

#CMD ["/usr/sbin/sshd", "-D"]
ENTRYPOINT /root/service.sh

