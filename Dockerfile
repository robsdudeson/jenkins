#https://github.com/jenkinsci/docker/blob/c2d6f2122fa03c437e139a317b7fe5b9547fe49e/Dockerfile
FROM jenkins:alpine

USER root
RUN apk update \
      && apk add sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
