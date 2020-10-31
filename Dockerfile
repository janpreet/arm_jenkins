FROM ubuntu:latest
MAINTAINER Janpreet Singh <janpreetsinghgill@gmail.com>

RUN apt-get update && apt-get install -y wget git

RUN apt-get install -y openjdk-11-jre-headless && \
    apt-get clean

WORKDIR /data

ENV JENKINS_HOME /var/jenkins_home
RUN useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins
VOLUME /var/jenkins_home

RUN chown -R jenkins "$JENKINS_HOME"
EXPOSE 8080

RUN mkdir -p /opt/jenkins && \
        cd /opt/jenkins && \
        wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war

CMD java -jar /opt/jenkins/jenkins.war --prefix=$PREFIX
