pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source repository...'
                checkout scm
            }
        }

        stage('Hygiene Check') {
            steps {
                echo 'Running repository hygiene checks...'
                sh 'bash scripts/hygiene.sh'
            }
        }

        stage('Install') {
            steps {
                echo 'Installing dependencies...'
                sh 'make install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated test suite...'
                sh 'make test'
            }
        }

        stage('Build') {
            steps {
                echo 'Executing build...'
                sh 'make build'
            }
        }
    }

    post {
        always {
            echo 'Jenkins pipeline execution completed.'
        }
        success {
            echo 'All stages completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check stage logs for details.'
        }
    }
}