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
     sh  label: '', script: 'scp /root/.jenkins/workspace/multibranch_loans/webapp/target/webapp.war ubuntu@10.3.1.121:/opt/tomcat/webapps/loanapp.war'
  }
  stage('Contionous Testing')
   {
        git credentialsId: 'GIT', url: 'https://github.com/premsgr6/FunctionalTesting.git'
       sh label: '', script: 'java -jar  /root/.jenkins/workspace/test3/testing.jar'
   }
 
   stage('Continous Delivery')
   {
      input message: 'waiting for approvel from delivery manager', submitter: 'sagar'
      sh label: '', script: 'scp /root/.jenkins/workspace/multibranch_loans/webapp/target/webapp.war ubuntu@10.3.1.16:/opt/tomcat8/webapps/prodloanapp.war' 
   }
    
 
}
