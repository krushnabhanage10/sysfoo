pipeline{
    agent{
        label "rhel"
    }
    triggers {
        pollSCM '* * * * *'
    }
    stages{
        stage("Requirement Gathering - Cloning Repo"){
            steps{
                git 'https://github.com/krushnabhanage10/sysfoo.git'
            }
        }
        stage("Build"){
            steps{
                withMaven {
                sh "mvn clean package"
            } 
            }
        }
    }
}
