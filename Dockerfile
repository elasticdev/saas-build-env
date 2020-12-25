FROM ubuntu:18.04
MAINTAINER Gary Leong <gwleong@gmail.com>

RUN apt-get update -y && \
    apt-get install autoconf make htop vim sysstat git zip wget python-dev \
                    rng-tools haveged python-setuptools curl python-yaml \
                    python-pip software-properties-common -y || rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && apt-get install nodejs npm -y

ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US
ENV LC_ALL en_US.UTF-8

#RUN pip install psutil 
#RUN pip install argparse==1.2.1
#RUN pip install paramiko==1.17.4
#RUN pip install pymongo==3.7.1 

# "install docker"
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - 
RUN apt-key fingerprint 0EBFCD88 
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	                    $(lsb_release -cs) \
	                    stable" || exit 1

apt-get update -y
apt-get install docker-ce -y

# Install Terraform
RUN cd /tmp && wget https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip && \
    unzip terraform_0.12.12_linux_amd64.zip && \
    mv terraform /usr/local/bin/

# Install Ansible
RUN pip install ansible
RUN pip install awslogs

RUN npm install -g serverless@1.82.0
RUN terraform --version
RUN ansible --version

#root@serverless-deploy:/opt/dev/engine-aws-lambda# serverless --version
#Framework Core: 1.82.0 (standalone)
#Plugin: 3.8.3
#SDK: 2.3.1
#Components: 2.34.9

# Check that it's installed



