FROM jenkins/jenkins:lts
USER root
# Install Tools and software
RUN apt-get update && apt-get install -y software-properties-common 
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main" | tee /etc/apt/sources.list.d/ansible.list
RUN apt -y install gnupg2 gnupg curl
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

# Add ssh key for ansible deployment
RUN mkdir /root/.ssh
COPY ./id_rsa /root/.ssh/id_rsa
COPY ./id_rsa.pub /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/id_rsa

# Install Ansible
RUN apt-get update && apt-get install -y ansible

# Install Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update && apt-get install terraform
RUN terraform --version

# drop back to the regular jenkins user - good practice
USER jenkins
