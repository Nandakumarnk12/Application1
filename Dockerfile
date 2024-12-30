pipeline {
    agent any
     environment {
        SCANNER_HOME = tool 'sonarqube'
    }
    stages {
        stage('git checkout') {
            steps {
             git 'https://github.com/Nandakumarnk12/Application1.git'
            }
        }
         stage('compile') {
            steps {
              sh 'mvn compile'
            }
        }
         stage('code analysis') {
            steps {
              withSonarQubeEnv('sonar-server') {
               sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Application1 \
               -Dsonar.java.binaries=. \
               -Dsonar.projectKey=Application1'''
              }
            }
        }
    }
}
