pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'chmod +x ./application/build.sh'
                sh './application/build.sh'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Exécution des tests...'
                // Ajoutez ici vos commandes de test
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Déploiement...'
                // Ajoutez ici vos commandes de déploiement
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline exécuté avec succès!'
        }
        failure {
            echo 'Le pipeline a échoué.'
        }
    }
}
