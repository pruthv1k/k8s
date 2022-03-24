FROM ubi7/ubi:7.7

MAINTAINER “Pruthvi Kumar” “pruthvisk4@gmail.com”
LABEL ”customjboss image using Containerfile”
RUN yum -y install unzip java-1.8.0-openjdk-devel

RUN mkdir -p /opt/rh

WORKDIR /opt/rh
COPY wildfly-23.0.2.Final.zip /tmp/wildfly-23.0.2.Final.zip

RUN unzip   /tmp/wildfly-23.0.2.Final.zip

ENV JBOSS_HOME /opt/rh/wildfly-23.0.2.Final

RUN $JBOSS_HOME/bin/add-user.sh admin admin1! --silent

EXPOSE 8080 9990 9999

CMD [“/opt/rh/wildfly-23.0.2.Final/bin/standalone.sh”,”-b”,”0.0.0.0”,”-bmanagement”,”0.0.0.0”]
