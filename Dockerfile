FROM centos:centos6
RUN curl -L https://www.opscode.com/chef/install.sh | bash
ADD . /provision
