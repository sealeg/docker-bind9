FROM centos:7
MAINTAINER Giles Thomas <giles@lemonman.org.uk>

RUN yum -y update && \
    yum -y install bind bind-utils && \
    yum clean all

EXPOSE 53 53/udp

COPY entrypoint.sh /
RUN  chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
#CMD ["named", "-u", "named", "-f"]

