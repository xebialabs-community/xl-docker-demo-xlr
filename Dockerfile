FROM openjdk:jre-alpine
MAINTAINER XebiaLabs "info@xebialabs.com"

RUN apk --no-cache add supervisor wget

RUN wget --progress=dot:giga -O /tmp/xl-release-trial.zip https://dist.xebialabs.com/xl-release-trial.zip && \
    mkdir -p /opt/xlr && unzip /tmp/xl-release-trial.zip -d /opt/xlr && \
    mv /opt/xlr/xl-release-*-server /opt/xlr/server && \
    rm -rf /tmp/xl-release-trial.zip

COPY resources/xl-release-server.conf /opt/xlr/server/conf/xl-release-server.conf
COPY resources/synthetic.xml /opt/xlr/server/ext/synthetic.xml

RUN /opt/xlr/server/bin/run.sh -setup -reinitialize -force && \
    rm -rf /opt/xlr/server/log/* /opt/xlr/server/tmp/* && \
    ln -fs /license/xl-release-license.lic /opt/xlr/server/conf/xl-release-license.lic

COPY resources/supervisord.conf /etc/supervisord.conf
COPY resources/xlr.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord"]

EXPOSE 5516
