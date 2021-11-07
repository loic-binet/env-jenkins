# env-jenkins

password :
>docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

azure cli :
>docker exec -it jenkins bash
>curl -sL https://aka.ms/InstallAzureCLIDeb | bash
>az login
