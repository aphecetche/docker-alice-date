FROM hepsw/slc-base

ADD yum-alice-daq.slc6_64.repo /root/tmp/

RUN cp /root/tmp/yum* /etc/yum.repos.d/

RUN yum update -y yum && \
  yum update -y

RUN yum install -y which date urw-fonts nc tmux

COPY ./date_setup.sh /

ENTRYPOINT ["/date_setup.sh"]
