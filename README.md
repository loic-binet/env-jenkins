# env-jenkins

password :
>docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

azure cli :
> * docker exec -it jenkins bash # Connect to jenkins container
> * curl -sL https://aka.ms/InstallAzureCLIDeb | bash # Install Azure cli
> * az login # Connect to Azure account
