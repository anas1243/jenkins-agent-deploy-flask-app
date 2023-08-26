# Project Title

Provision and Configure Jenkins master and agent to deploy a dockerized simple flask application using Terraform, ansible, Docker, and Jenkins (controller and agent)

## Technology
![Docker](images/icons8-docker-48.png) ![Python](images/icons8-python-48.png) ![Flask](images/icons8-flask-50.png) ![Terraform](images/icons8-terraform-48.png) ![Ansible](images/icons8-ansible-48.png) ![Jenkins](images/icons8-jenkins-48.png)


## Project Diagram

![Project Design](images/Diagram.png)


## Description

This project aimed to integrate my knowledge in Docker, Terraform, Ansible, and Jenkins in one simple project.

This project is consists of two parts:

- Provision and configure the needed infrastructure for the jenkins controller, jenkins agent, and the flask webapp using terraform and Ansible.
- Build, and Deploy the python flask app on EC2 by running the Jenkins pipeline on the jenkins agent that is deployed as a container on the flask webapp Ec2 as container.

### Github Repositories
1- https://github.com/anas1243/jenkins-agent-deploy-flask-app

2- https://github.com/anas1243/simple-flask-application

3- https://github.com/anas1243/public-network-terraform-module

Network module that I'm using to provision simple vpc, gateways, and subnets for testing purposes. I only pass the variables values according to the use case.

## Getting Started

### Dependencies

In order to provision the infrastructure on aws and configure them using ansible you need the following softwares

* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)


### Steps Followed:

1- Configure AWS CLI

```aws configure```

Then put you access key and your secrets access key

2- Clone the git repo

```git clone https://github.com/anas1243/jenkins-agent-deploy-flask-app.git```

3- Provision the infra structure

```cd jenkins-agent-deploy-flask-app/infra && terraform apply```

Accept the prompt

![Success Infra provisioning](images/success-infra.png)

4- Configure Jenkins

* Get Jenkins unlock password from `/var/jenkins_home/secrets/initialAdminPassword`

![Get Jenkins Pass](images/get-jenkins-pass.png)

![unlock Jenkins](images/unlock-jenkins.png)

* Install Jenkins Plugins

![Install Jenkins Plugins](images/install-plugins.png)



* Configure authentication and Authorization in Jenkins (optional)

1- Install role-based Access Plugin then enable it from the security Section

![Install role-based access](images/role-based-access.png)

![Enable role-based access](images/enable-role-based.png)

2- Add users, and roles and assign them to the roles

![Add new user](images/add-user.png)

![Make new role](images/add-role.png)

![assign role to the created user](images/assign-user.png)


* Add Docker hub credentials and ec2 ssh key credentials into Jenkins Credentials

![docker hub creds](images/dockerhub-cred.png)
![ssh key file](images/ssh-key.png)
![jenkins cred dashboard](images/jenkins-secrets.png)

5- Configure Jenkins agent

* Create A new flask agent node

![Create A new flask agent node](images/new-node.png)

* Set # of executers, root directory, and label

![Create A new flask agent node](images/configure-node-1.png)

* configure ssh to connect to the Jenkins agent on port 2200

![Create A new flask agent node](images/configure-node-2.png)

* Confirm That the Jenkins agent is Online and connected

![Create A new flask agent node](images/confirm-agent.png)

6- Configure The  pipeline


* Create a  pipeline

![create a pipeline](images/create-pipeline.png)

* Configure logs rotation to save only 5 builds

![Configure logs rotation](images/log-rotation.png)


* Configure Jenkins to be triggered when any change pushed to the web server repo

![Jenkins to be triggered when any change pushed](images/webhook-jenkins.png)

* Configure github to send a webhook to the jenkins server when any change is pushed

![github to send a webhook to the jenkins](images/webhook-github.png)

* Verify the webhook

![Verify the webhook](images/check-webhook.png)

* Specify the Github repo of the flask web app and the remote Jenkins Pipeline script

![Specify the Github repo](images/webserver-repo.png)

## Trigger the pipeline by making changes in the web server code

1- make a change in the webserver code 

![make a change in the webserver code](images/automation-path-webserver.png)

2- push the changes to the web servers' github repo

![push the changes to the web servers' github repo](images/push-to-webserver.png)

4- Success jenkins build
![Success jenkins build](images/successful-jenkins-build.png)

5- Check the the changes on the webserver by hitting the web server on port 80 and path `automation`
![Check the the changes on the webserver](images/check-webserver.png)

