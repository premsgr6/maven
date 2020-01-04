node('master')
{
    
    stage('GITSCM')
    {
    // CLONING THE GIT REPOSITORY
      git credentialsId: 'GIT', url: 'https://github.com/premsgr6/maven.git'
    }
    
    stage('Continous integration')
    {
      // building the artifact using maven
    withMaven(jdk: 'java', maven: 'maven') {
       sh label: '', script: 'mvn package'
    }
    }
    
    stage('Continous Deployment')
    {
      // Deploying the artifact into QA server into tomcat server
        sh label: '', script: 'scp /root/.jenkins/workspace/test3/webapp/target/webapp.war ubuntu@10.3.1.121:/opt/tomcat/webapps/qaapp.war'
    }
   
   stage('Contionous Testing')
   {
     // cloning selenium functional testing and even can add test manager to approve the stage adding input mesg after git
      git credentialsId: 'GIT', url: 'https://github.com/premsgr6/FunctionalTesting.git'
       sh label: '', script: 'java -jar  /root/.jenkins/workspace/test3/testing.jar'
   }
 
   stage('Continous Delivery')
   {
     //production manager sagar need to approve at this stage
       input message: 'waiting for approvel from delivery manager', submitter: 'sagar'
       sh label: '', script: 'scp /root/.jenkins/workspace/test3/webapp/target/webapp.war ubuntu@10.3.1.16:/opt/tomcat8/webapps/prodapp.war' 
   }
 
}
