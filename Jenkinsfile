pipeline {
    agent {
        docker {
            image 'python:3.11-slim'
            args '-u root'
        }
    }

    environment {
        PROJECT_DIR = "pygoat"
        RESULT_FILE = "safety_scan_result.json"
    }

    stages {
        stage('Checkout') {
            steps {
                echo '📦 Clonando el repositorio pygoat...'
                sh 'rm -rf pygoat || true'
                sh 'git clone https://github.com/adeyosemanputra/pygoat.git'
            }
        }

        stage('Instalar Safety CLI') {
            steps {
                echo '🐍 Instalando Safety CLI...'
                sh '''
                    pip install --upgrade pip
                    pip install safety
                '''
            }
        }

        stage('Instalar dependencias del proyecto') {
            steps {
                echo '📚 Instalando dependencias del proyecto...'
                dir("${PROJECT_DIR}") {
                    sh '''
                        pip install -r requirements.txt || true
                    '''
                }
            }
        }

        stage('Escanear con Safety CLI') {
            steps {
                echo '🔍 Ejecutando escaneo con Safety...'
                dir("${PROJECT_DIR}") {
                    sh '''
                        safety check --full-report --json > ../${RESULT_FILE} || true
                    '''
                }
            }
        }

        stage('Guardar Resultados') {
            steps {
                echo '💾 Guardando resultados del escaneo...'
                archiveArtifacts artifacts: "${RESULT_FILE}", fingerprint: true
            }
        }
    }

    post {
        always {
            echo '✅ Pipeline finalizado.'
            sh 'ls -l'
        }
    }
}

