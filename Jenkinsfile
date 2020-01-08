node('master') 
{
  stage('ContinuousDownload_Loans') 
  {
    git credentialsId: 'GIT', url: 'https://github.com/premsgr6/maven.git'
  } 
  stage('ContinuousBuild_Loan')
  {
      withMaven(jdk: 'java', maven: 'maven') {
        sh label: '', script: 'mvn package'
    }
  }
  stage('ContinuousDeployment_Loans')
  {
     sh label: '', script: 'scp /root/.jenkins/workspace/test3/webapp/target/webapp.war ubuntu@10.3.1.121:/opt/tomcat/webapps/loanapp.war'    
  }
  
  
  
  
  
}
