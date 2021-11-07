# env-jenkins

password :
>docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

## azure cli :

Connect to jenkins container :
> docker exec -it jenkins bash 

Install Azure cli :
> curl -sL https://aka.ms/InstallAzureCLIDeb | bash 

Connect to Azure account :
> az login 
