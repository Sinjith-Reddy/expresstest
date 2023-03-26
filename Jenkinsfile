pipeline {
    agent { label 'nodejs'}
    stages {
        // Fetch code from  github  
        stage('checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sinjith-Reddy/expresstest.git'
            }
        }
        // Build application

        stage('Build'){
            steps{
                sh 'cd express'
                sh 'npm install'
            }
        }
        // starting application
        stage('start application'){
            steps{
            sh 'node examples/hello-world'
            }
        }
    }
}
