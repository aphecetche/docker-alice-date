FROM hepsw/slc-base

ADD yum-alice-daq.slc6_64.repo /etc/yum.repos.d/

RUN rpmdb --rebuilddb && \
    yum clean all && \
    yum update -y yum && \
    yum update -y && \
    yum install -y which date urw-fonts nc tmux

COPY ./date_setup.sh /

ENTRYPOINT ["/date_setup.sh"]
