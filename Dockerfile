FROM jenkins/jenkins:lts
USER root
# Install Tools and software
RUN apt-get update && apt-get install -y software-properties-common unzip wget
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main" | tee /etc/apt/sources.list.d/ansible.list
RUN apt -y install gnupg2
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

RUN mkdir /root/.ssh
COPY ./id_rsa /root/.ssh/id_rsa
COPY ./id_rsa.pub /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/id_rsa

# Install Ansible
RUN apt-get update && apt-get install -y ansible

# Install Terraform
ARG TERRAFORM_VERSION=1.0.10
RUN wget --progress=dot:mega https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN \
        unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
        mv terraform /usr/local/bin/ && \
        chmod +x /usr/local/bin/terraform && \
        terraform --version

# drop back to the regular jenkins user - good practice
USER jenkins
