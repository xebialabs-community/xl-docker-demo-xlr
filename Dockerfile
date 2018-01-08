FROM openjdk:jre-alpine
MAINTAINER XebiaLabs "info@xebialabs.com"
RUN apk update && apk add supervisor wget
RUN wget -O /tmp/xl-release-trial.zip https://dist.xebialabs.com/xl-release-trial.zip && mkdir -p /opt/xlr && unzip /tmp/xl-release-trial.zip -d /opt/xlr && mv /opt/xlr/xl-release-*-server /opt/xlr/server && rm -rf /tmp/xl-release-trial.zip
ADD resources/xl-release-server.conf /opt/xlr/server/conf/xl-release-server.conf
ADD resources/synthetic.xml /opt/xlr/server/ext/synthetic.xml
RUN /opt/xlr/server/bin/run.sh -setup -reinitialize -force
ADD resources/supervisord.conf /etc/supervisord.conf
RUN ln -fs /license/xl-release-license.lic /opt/xlr/server/conf/xl-release-license.lic
CMD ["/usr/bin/supervisord"]
EXPOSE 5516
