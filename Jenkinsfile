#!/usr/bin/env groovy

node {

    def gitCommit
    def shortGitCommit
    def previousGitCommit

    stage('checkout') {
        checkout scm

        sh 'printenv'

        gitCommit = sh(script: "git rev-parse HEAD", returnStdout: true).trim()
        shortGitCommit = "${gitCommit[0..10]}"
        previousGitCommit = sh(script: "git rev-parse ${gitCommit}~", returnStdout: true)

        echo "gitCommit = ${gitCommit}"
        echo "shortGitCommit = ${shortGitCommit}"
        echo "previousGitCommit = ${previousGitCommit}"
    }

    stage('pacakge') {
        sh 'cd adidas-adapter-api && mvn install'
        sh 'cd adidas-adapter-impl && mvn clean package'
    }

    stage('docker-build') {
        sh "cd adidas-adapter-impl && docker build -t ic-harbor.baozun.com/hub/adidas-adapter-impl:${shortGitCommit} -f docker/Dockerfile  ./"
    }

    stage('docker-push') {
        sh "docker push ic-harbor.baozun.com/hub/adidas-adapter-impl:${shortGitCommit}"
    }


//stage('k8s deploy') {
 //   sh "sed -i 's/lusyoe\\/k8s-example/ic-harbor.baozun.com\\/sit\\/k8s-example:${shortGitCommit}/g' k8s-example.yaml"
  //  sh "kubectl --kubeconfig=/root/.kube/config apply -f k8s-example.yaml"
//}
}