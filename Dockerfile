FROM ubi8/ubi:8.3
 
MAINTAINER Pruthvi Kumar <prukumar@redhat.com>
 
LABEL description="A custom Jboss container based on UBI 8"
 
RUN yum install -y unzip java-1.8.0-openjdk-devel
 
RUN mkdir -p /opt/jboss
 
WORKDIR /opt/jboss
 
COPY jboss-eap-7.4.0.zip /opt/jboss/jboss-eap-7.4.0.zip
 
RUN unzip jboss-eap-7.4.0.zip
 
ENV JBOSS_HOME /opt/jboss/jboss-eap-7.4
 
RUN $JBOSS_HOME/bin/add-user.sh admin admin1! --silent
 
EXPOSE 8080 9990 9999
 
CMD ["opt/jboss/jboss-eap-7.4/bin/stanadalone.sh","-b","0.0.0.0","-bmanagement","0.0.0.0"]
