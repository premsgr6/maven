FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY /root/.jenkins/workspace/docker-app/webapp/target/webapp.war /usr/local/tomcat/webapps/web.war
