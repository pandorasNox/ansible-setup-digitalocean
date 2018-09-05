
FROM ubuntu:18.04

# tools
RUN apt-get update && \
	apt-get install -y \
		software-properties-common \
		python-pip \
		git \
		curl \
		rsync \
		gettext-base \
		nano dnsutils \
		iputils-ping \
		openssh-client \
		sshpass \
		make \
		bash-completion \
		apache2-utils \
		bats && \
	apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ansible
ENV ANSIBLE_VERSION 2.6.3
RUN pip install ansible==${ANSIBLE_VERSION}

# enable bash autocompletion
RUN echo . /etc/bash_completion >> /root/.bashrc

# COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
# RUN chmod +x /bin/docker-entrypoint.sh
# ENTRYPOINT ["/bin/docker-entrypoint.sh"]
