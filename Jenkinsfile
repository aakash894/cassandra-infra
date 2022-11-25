def skipRemainingStages = false
pipeline {
    agent any
    parameters {
        choice choices: ['Apply', 'Destroy'], name: 'Infrastruture'
        choice choices: ['us-west-2a', 'us-west-2b', 'us-west-2c', 'us-west-2d'], description: 'Select the availability zone in which you want to create your subnet', name: 'AZ1'
        choice choices: ['us-west-2a', 'us-west-2b', 'us-west-2c', 'us-west-2d'], description: 'Select the availability zone for higher availibity of your resources', name: 'AZ2'
        string defaultValue: 'ami-017fecd1353bcc96e', description: 'Input amazon image id', name: 'AMI'
        string defaultValue: 't2.medium', description: 'Input instance type', name: 'instance_type'
        string defaultValue: 'oregon', description: 'Input key pair name which you want to provide to your machine & ensure it will be pre-generated', name: 'key_name'
        string defaultValue: '3', description: 'Input node count for your database cluster', name: 'node_count'
        string defaultValue: 'ubuntu', description: 'Specify the user of your ec2 instances [ubuntu for ubuntu and ec2-user for redhat]', name: 'VM_USER', trim: true
        choice choices: ['apt', 'yum'], description: 'Select package manager i.e. in case of ubuntu -> apt and in redhat -> yum', name: 'Package_manager'
        choice choices: ['4.0.7', '3.11.14', '3.0.28'], description: 'Select your cassandra database version', name: 'version'
    }
    stages {
        stage('Validating configrations') {
            steps{
                sh'''
                terraform fmt
                terraform validate
                '''
            }
            post {
                success {
                    slackSend channel: 'C043N02HGDP', color: 'good', message: 'Your build for Validating configrations is successful'
                }
                unstable { 
                    slackSend channel: 'C043N02HGDP', color: 'warning', message: 'Your build for Validating configrations is unstable'
                }
                failure { 
                    slackSend channel: 'C043N02HGDP', color: 'danger', message: 'Your build for Validating configrations is failed'
                }
            }
        }
        stage('Initializing the terraform') {
            steps{
                sh 'terraform init'
            }
            post {
                success {
                    slackSend channel: 'C043N02HGDP', color: 'good', message: 'Your build for terraform initilializing is successful'
                }
                unstable { 
                    slackSend channel: 'C043N02HGDP', color: 'warning', message: 'Your build for terraform initilializing is unstable'
                }
                failure { 
                    slackSend channel: 'C043N02HGDP', color: 'danger', message: 'Your build for terraform initilializing is failed'
                }
            }
        }
        stage('Destroy Infrastructure'){
            when {
                expression { params.Infrastruture == 'Destroy' }
            }
            steps {
                script {
                    skipRemainingStages = true
                    input('Do you really want to destroy Infrastructure?')
                    sh 'terraform destroy --auto-approve'
                }
            }
            post {
                success {
                    slackSend channel: 'C043N02HGDP', color: 'good', message: 'Your build for Infrastructure destruction is successful'
                }
                unstable { 
                    slackSend channel: 'C043N02HGDP', color: 'warning', message: 'Your build for Infrastructure destruction is unstable'
                }
                failure { 
                    slackSend channel: 'C043N02HGDP', color: 'danger', message: 'Your build for Infrastructure destruction is failed'
                }
            }    
        }
        stage('Building Infrastructure'){
            when {
                expression { params.Infrastruture == 'Apply' }
            }
            steps {
                script{
                    input('Do you want to create Infrastructure?')
                    sh 'terraform apply --auto-approve -var="AZ1=${AZ1}" -var="AZ2=${AZ2}" -var="ami=${AMI}" -var="instance_type=${instance_type}" -var="key_name=${key_name}" -var="node_count=${node_count}"'
                }
            }
            post {
                success {
                    slackSend channel: 'C043N02HGDP', color: 'good', message: 'Your build for Building Infrastructure is successful'
                }
                unstable { 
                    slackSend channel: 'C043N02HGDP', color: 'warning', message: 'Your build for Building Infrastructure is unstable'
                }
                failure { 
                    slackSend channel: 'C043N02HGDP', color: 'danger', message: 'Your build for Building Infrastructure is failed'
                }
            } 
        }
        stage('Setting up Inventory'){
            when {
                expression {
                    !skipRemainingStages
                }
            }
            steps {
                sh'''
                chmod +x file.sh
                ./file.sh $VM_USER /home/$VM_USER/${key_name}.pem
                '''
            }
            post {
                success {
                    slackSend channel: 'C043N02HGDP', color: 'good', message: 'Your build for Setting up Inventory is successful'
                }
                unstable { 
                    slackSend channel: 'C043N02HGDP', color: 'warning', message: 'Your build for Setting up Inventory is unstable'
                }
                failure { 
                    slackSend channel: 'C043N02HGDP', color: 'danger', message: 'Your build for Setting up Inventory is failed'
                }
            }             
        }
        stage('Data Transfer'){
            when {
                expression {
                    !skipRemainingStages
                }
            }
            steps {
                sh'''
                IP=$(terraform output -json Bastion-publicIP | jq -r)
                echo $IP
                ssh -i "~/${key_name}.pem" -o StrictHostKeyChecking=no -tt $VM_USER@$IP "rm -rf Invnetory ${key_name}.pem"
                scp -i "~/${key_name}.pem" -o StrictHostKeyChecking=no -r Invnetory $VM_USER@$IP:~
                scp -i "~/${key_name}.pem" -o StrictHostKeyChecking=no -r ~/${key_name}.pem $VM_USER@$IP:~
                '''
            }
            post {
                success {
                    slackSend channel: 'C043N02HGDP', color: 'good', message: 'Your build for Transferring Data is successful'
                }
                unstable { 
                    slackSend channel: 'C043N02HGDP', color: 'warning', message: 'Your build for Transferring Data is unstable'
                }
                failure { 
                    slackSend channel: 'C043N02HGDP', color: 'danger', message: 'Your build for Transferring Data is failed'
                }
            }             
        }
        stage('Configure ansible'){
            when {
                expression {
                    !skipRemainingStages
                }
            }
            steps {
                sh'''
                IP=$(terraform output -json Bastion-publicIP | jq -r)
                echo $IP
                ssh -i "~/${key_name}.pem" -o StrictHostKeyChecking=no -tt $VM_USER@$IP "sudo $Package_manager update -y && sudo $Package_manager install git -y && sudo $Package_manager install ansible -y"
                '''
            }
            post {
                success {
                    slackSend channel: 'C043N02HGDP', color: 'good', message: 'Your build for configure ansible is successful'
                }
                unstable { 
                    slackSend channel: 'C043N02HGDP', color: 'warning', message: 'Your build for configure ansible is unstable'
                }
                failure { 
                    slackSend channel: 'C043N02HGDP', color: 'danger', message: 'Your build for configure ansible is failed'
                }
            } 
        }
        stage('Cloning the ansible role'){
            when {
                expression {
                    !skipRemainingStages
                }
            }
            steps {
                sh'''
                IP=$(terraform output -json Bastion-publicIP | jq -r)
                echo $IP
                ssh -i "~/${key_name}.pem" -o StrictHostKeyChecking=no -tt $VM_USER@$IP "rm -rf cassandra"
                ssh -i "~/${key_name}.pem" -o StrictHostKeyChecking=no -tt $VM_USER@$IP "git clone https://github.com/aakash894/cassandra.git"
                '''
            }
            post {
                success {
                    slackSend channel: 'C043N02HGDP', color: 'good', message: 'Your build for Cloning ansible role is successful'
                }
                unstable { 
                    slackSend channel: 'C043N02HGDP', color: 'warning', message: 'Your build for Cloning ansible role is unstable'
                }
                failure { 
                    slackSend channel: 'C043N02HGDP', color: 'danger', message: 'Your build for Cloning ansible role is failed'
                }
            } 
        }
        stage('Cluster setup'){
            when {
                expression {
                    !skipRemainingStages
                }
            }
            steps {
                sh'''
                IP=$(terraform output -json Bastion-publicIP | jq -r)
                echo $IP
                ssh -i "~/${key_name}.pem" -o StrictHostKeyChecking=no -tt $VM_USER@$IP "ansible-playbook -e version=${version} -i Invnetory ~/cassandra/Cassandra_review/test/cassandra.yml"
                '''
            }
            post {
                success {
                    slackSend channel: 'C043N02HGDP', color: 'good', message: 'Your build for Setting up Cluster is successful'
                }
                unstable { 
                    slackSend channel: 'C043N02HGDP', color: 'warning', message: 'Your build for Setting up Cluster is unstable'
                }
                failure { 
                    slackSend channel: 'C043N02HGDP', color: 'danger', message: 'Your build for Setting up Cluster is failed'
                }
            } 
        }
    }    
}
