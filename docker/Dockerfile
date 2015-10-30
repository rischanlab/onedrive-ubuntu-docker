#--------- Generic stuff all our Dockerfiles should start with so we get caching ------------
# Note this base image is based on debian
FROM ubuntu:14.04
MAINTAINER Rischan Mafur<rischan@kartoza.com>

RUN apt-get update && apt-get install -y \
	python3-dev \
	python3-pip \
	python3-setuptools \
	git-core \
	ca-certificates \
	ssh

RUN mkdir -p /root/.ssh
# add custom ssh config / keys to the root user
RUN mkdir -p /root/.ssh
# Fixes permission if needed
# RUN chmod 600 /root/.ssh/*

# Added github.com as known_hosts
RUN ssh-keyscan -p2200 github.com > /root/.ssh/known_hosts

WORKDIR /

RUN git clone https://github.com/xybu/onedrive-d-old.git onedrive
RUN cd onedrive \
	&& python3 setup.py install \
	&& python3 setup.py clean 

RUN mkdir ~/.onedrive
RUN cp /onedrive/onedrive_d/res/default_ignore.ini ~/.onedrive/ignore_v2.ini

RUN touch /var/log/onedrive_d.log
RUN chown `whoami` /var/log/onedrive_d.log

# Open port 22 as ssh port
EXPOSE 22
CMD ["onedrive-d", "start"]
