# env-jenkins

* Create SSH key pair (public/private)
* Add id_rsa and id_rsa.pub in the same path to Dockerfile

Create Docker image on Dockerhub :
In docker command and docker-compose.yml replace repository by your Dockerhub repository 

> * docker build -t jenkins .
> * docker tag jenkins repository/jenkins:latest
>  * docker push repository/jenkins:latest

## Docker-compose

* import docker-compose.yml file
* exec command :
> docker-compose up -d

view jenkins default password :
>docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

## azure cli :

Connect to jenkins container :
> docker exec -it jenkins bash 

Install Azure cli :
> curl -sL https://aka.ms/InstallAzureCLIDeb | bash 

Connect to Azure account :
> az login 
