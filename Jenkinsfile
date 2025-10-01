node {
    stage('Preparation') { // for display purposes
        // Get some code from a GitHub repository
        git 'https://github.com/digininja/DVWA.git'
    }
    stage('Build') {
        sh 'cd DVWA'
    }
    stage('Results') {
        sh 'ls -la'
    }
}
