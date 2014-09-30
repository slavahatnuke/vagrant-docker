FROM ubuntu:precise

# install

## update
RUN apt-get update

## curl
RUN apt-get install -y curl

## chef
RUN curl -L https://www.opscode.com/chef/install.sh | bash
RUN apt-get install -y rubygems

RUN gem install librarian-chef

## chef provision
ADD ./chef /chef
RUN cd /chef && librarian-chef install

## sshd

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config


# ports
EXPOSE 22

# run
CMD /usr/sbin/sshd -D