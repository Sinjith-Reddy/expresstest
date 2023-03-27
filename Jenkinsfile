pipeline {
    agent { label 'nodejs'}
    environment {
        DOCKERHUB_CREDENTIALS = credentials('DockerHub')
        REMOTE_SERVER = '3.91.213.166'
        REMOTE_USER = 'centos'
    }
    stages {
        // Fetch code from  github  
        stage('checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sinjith-Reddy/express.git'
            }
        }
        // Build application
        stage('Build'){
            steps{
                sh 'npm install'
            }
        }
        // build docker image
        stage('Build Docker Image'){
            steps {
            sh 'docker build -t hello-world-js:latest .'
            }
        }
        //Login and Push image to DockerHub 
        /*stage ('Login to DockerHub'){
            steps {
                sh  'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        
        stage('Push image to DockerHub'){
            steps{
                sh 'docker push sinjithreddy/hello-world-js:latest'
            }
            post {
              always {
                sh 'docker logout'
              }
            }
        } 
        //deploy docker image
          stage('deploy docker image'){
              steps{
                  sshagent(credentials:['centos']) {
                      sh "ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_SERVER} 'docker stop hello-world-js || true && docker rm hello-world-js || true'"
                      sh "ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_SERVER} 'docker pull sinjithreddy/hello-world-js'"
                      sh "ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_SERVER} 'docker run --name hello-world-js -d -p 8000:3000 sinjithreddy/hello-world-js'"
                  }
              }
            
          }*/
          
    }
}
