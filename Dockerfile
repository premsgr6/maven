FROM tomcat:8.0.20-jre8
MAINTAINER prem
#FROM tomcat:8
# Take the war and copy to webapps of tomcat
RUN apt update -y
RUN 

COPY /root/.jenkins/workspace/docker-app/webapp/target/webapp.war /usr/local/tomcat/webapps/web.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
