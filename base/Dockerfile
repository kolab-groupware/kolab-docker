FROM centos:centos6
MAINTAINER Kolab Systems <vanmeeuwen@kolabsys.com>
RUN yum -y install epel-release
ADD http://obs.kolabsys.com/repositories/Kolab:/Development/CentOS_6/Kolab:Development.repo \
    /etc/yum.repos.d/Kolab:Development.repo
RUN rpm --import https://ssl.kolabsys.com/community.asc
RUN yum clean all
RUN yum -y update
