pipeline {
    agent { label 'windows' }

    triggers {
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                bat '''
                python -m venv .venv
                .\\.venv\\Scripts\\python.exe -m pip install -r requirements.txt
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Testing..'
                bat '''
                .\\.venv\\Scripts\\robot.exe -d reports\\results -i TS_04002_001 .
                '''
            }
        }

        stage('Deliver') {
            steps {
                echo 'Deliver....'
                bat '''
                echo doing delivery stuff..
                '''
            }
        }
    }
}