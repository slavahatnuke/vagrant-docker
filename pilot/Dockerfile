FROM ubuntu:precise

# install

## sshd

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# ports
EXPOSE 22

# run
CMD /usr/sbin/sshd -D