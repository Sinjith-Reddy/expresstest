pipeline {
    agent { label 'nodejs'}
    environment {
        DockerHub = credentials('DockerHub')
        REMOTE_SERVER = '3.91.213.166'
        REMOTE = credentials('EC2')
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
            sh 'docker build -t sinjithreddy/hello-world-js:latest .'
            }
        }
       //Login and Push image to DockerHub 
        stage ('Login to DockerHub'){
            steps {
                sh  'echo $DockerHub_PSW | docker login -u $DockerHub_USR --password-stdin'
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
                  sshagent(credentials:['EC2']) {
                      sh "ssh -o StrictHostKeyChecking=no ${REMOTE_USR}@${REMOTE_SERVER} 'docker stop hello-world-js && docker rm hello-world-js'"
                      sh "ssh -o StrictHostKeyChecking=no ${REMOTE_USR}@${REMOTE_SERVER} 'docker pull sinjithreddy/hello-world-js'"
                      sh "ssh -o StrictHostKeyChecking=no ${REMOTE_USR}@${REMOTE_SERVER} 'docker run --name hello-world-js -dt -p 8000:3000 sinjithreddy/hello-world-js:latest'"
                  }
              }
            
          }
          
    }
}
