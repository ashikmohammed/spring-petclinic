
   
pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" in jenkins
        maven "M3"
    }
   
    stages {

        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git url: 'https://github.com/ashikmohammed/spring-petclinic',  branch: 'main'
                withCredentials([usernamePassword(credentialsId: 'jfrog', passwordVariable: 'DOCKER_REGISTRY_PWD', usernameVariable: 'DOCKER_REGISTRY_USER')]) {
                // Run Maven on a Unix agent.
                    sh "./mvnw -ntp test jib:build"
                }

            }

        }

    }
}
